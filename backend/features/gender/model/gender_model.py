from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from core.database import Base
from .product_gender import product_genders


class ProductGenderModel(Base):
    __tablename__ = "productsGenderTable"
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    products = relationship(
        "ProductModel", secondary=product_genders, back_populates="genders"
    )
