from sqlalchemy import Column, Integer, Float, ForeignKey, String
from sqlalchemy.orm import relationship
from core.database import Base
from .schema import OrderStatus


class OrderModel(Base):
    __tablename__ = "orders"

    id = Column(Integer, primary_key=True, index=True)
    product_id = Column(Integer, ForeignKey("productsTable.id"), nullable=False)
    unit_price = Column(Float, nullable=False)
    product = relationship("ProductModel", back_populates="orders")
    quantity = Column(Integer, nullable=False)
    status = Column(String, nullable=False, default=OrderStatus.PENDING)
