from .repository import create_order
from .repository import get_orders as get_all_orders
from features.product.service import decrease_product_stock
from sqlalchemy.orm import Session
from .repository import get_order_by_id
from .exception import (
    OrderNotFoundError,
    OrderAlreadyCancelledError,
    OrderAlreadyPaidError,
    OrderCannotBeCancelledError,
    OrderCannotBePaidError,
    OrderCannotBeShippedError,
)
from features.product.service import increase_product_stock
from .schema import OrderStatus


def create_new_order(db: Session, product_id: int, quantity: int):
    try:

        product = decrease_product_stock(db, product_id, quantity)

        order = create_order(db, product_id, quantity, product.price)
        db.flush()
        db.commit()
        return order
    except Exception:
        db.rollback()
        raise


def get_all_order(db: Session):
    orders = get_all_orders(db)

    return orders


def get_order(db: Session, order_id: int):
    order = get_order_by_id(db, order_id)
    if order is None:
        raise OrderNotFoundError()
    return order


def cancle_order(db: Session, order_id: int):

    try:
        order = get_order_by_id(db, order_id)
        if order is None:
            raise OrderNotFoundError()
        if order.status == OrderStatus.CANCELLED:
            raise OrderAlreadyCancelledError()
        if order.status != OrderStatus.PENDING:
            raise OrderCannotBeCancelledError()
        increase_product_stock(db, order.product_id, order.quantity)
        order.status = "cancelled"
        db.commit()
        return order
    except Exception:
        db.rollback()
        raise


def pay_order(db: Session, order_id: int):
    order = get_order_by_id(db, order_id)
    if order is None:
        raise OrderNotFoundError()
    if order.status == OrderStatus.PAID:
        raise OrderAlreadyPaidError()
    if order.status != OrderStatus.PENDING:
        raise OrderCannotBePaidError()
    order.status = OrderStatus.PAID
    db.commit()
    db.refresh(order)
    return order


def ship_order(db: Session, order_id: int):
    order = get_order_by_id(db, order_id)
    if order is None:
        raise OrderNotFoundError()
    if order.status != OrderStatus.PAID:
        raise OrderCannotBePaidError()
    order.status = OrderStatus.SHIPPED
    db.commit()
    db.refresh(order)
    return order
