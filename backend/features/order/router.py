from fastapi import APIRouter, Depends
from pydantic import BaseModel
from .service import (
    create_new_order,
    get_all_order,
    cancle_order,
    pay_order,
    get_order as get_order_by_id,
    ship_order,
)
from sqlalchemy.orm import Session
from core.database import get_db
from .schema import OrderCreate, OrderResponse

router = APIRouter(prefix="/orders", tags=["orders"])


@router.post("/", response_model=OrderResponse)
def creat_order(data: OrderCreate, db: Session = Depends(get_db)):
    return create_new_order(db, data.product_id, data.quantity)


@router.get("/", response_model=list[OrderResponse])
def get_orders(db: Session = Depends(get_db)):
    return get_all_order(db)


@router.get("/{order_id}", response_model=OrderResponse)
def get_order(order_id: int, db: Session = Depends(get_db)):
    return get_order_by_id(db, order_id)


@router.delete("/{order_id}", response_model=OrderResponse)
def cancle_order_router(order_id: int, db: Session = Depends(get_db)):
    return cancle_order(db, order_id)


@router.post("/{order_id}/pay", response_model=OrderResponse)
def pay_order_router(order_id: int, db: Session = Depends(get_db)):
    return pay_order(db, order_id)


@router.post("/{order_id}/shipped", response_model=OrderResponse)
def shipped_order(order_id: int, db: Session = Depends(get_db)):
    return ship_order(db, order_id)
