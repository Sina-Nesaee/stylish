from sqlalchemy import Table, Column, Integer, ForeignKey, String
from sqlalchemy.orm import relationship
from core.database import Base
from .product_season import product_season


class ProductSeasonModel(Base):
    __tablename__ = "productsSeasonTable"
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    products = relationship(
        "ProductModel", secondary=product_season, back_populates="seasons"
    )
