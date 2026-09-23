from sqlalchemy.orm import Session
from .model import OrderModel

# create new order
def create_order(db:Session , product_id:int , quantity:int , unit_price:float):
    order = OrderModel(
        product_id = product_id,
        quantity = quantity,
        unit_price = unit_price
    )
    db.add(order)


    return order


# get all orders
def get_orders(db:Session):
    return db.query(OrderModel).all()


#get order by id
def get_order_by_id(db:Session , order_id:int):
    return(
        db.query(OrderModel)
        .filter(OrderModel.id ==order_id)
        .first()
    )


# delete order
# def delete_order_by_id(db:Session,order_id:int):
#     order = (
#         db.query(OrderModel)
#         .filter(OrderModel.id==order_id)
#         .first()

#     )
#     if order is None:
#         return None
#     db.delete(order)
#     return order

