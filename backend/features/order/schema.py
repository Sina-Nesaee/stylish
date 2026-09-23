from enum import Enum
from pydantic import BaseModel, Field, computed_field


class OrderStatus(str, Enum):
    PENDING = "pending"
    PAID = "paid"
    SHIPPED = "shipped"
    CANCELLED = "cancelled"


class OrderProductResponse(BaseModel):
    id: int
    title: str
    price: float

    class Config:
        from_attributes = True


class OrderCreate(BaseModel):
    product_id: int = Field(gt=0)
    quantity: int = Field(gt=0)


class OrderResponse(BaseModel):
    id: int
    product_id: int
    quantity: int
    unit_price: float
    status: OrderStatus
    product: OrderProductResponse

    @computed_field
    @property
    def total_price(self) -> float:
        return self.quantity * self.unit_price
