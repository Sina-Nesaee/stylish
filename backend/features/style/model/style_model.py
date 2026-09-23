from sqlalchemy import Integer, ForeignKey, Column, String
from sqlalchemy.orm import relationship
from core.database import Base


class ProductStyleModel(Base):
    __tablename__ = "productsStyleTable"
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    products = relationship(
        "ProductModel", secondary="product_style", back_populates="styles"
    )
