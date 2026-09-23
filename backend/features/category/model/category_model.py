from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from core.database import Base


class ProductCategoryModel(Base):
    __tablename__ = "CategoriesTable"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    image = Column(String, nullable=False)
    products = relationship("ProductModel", back_populates="category")
