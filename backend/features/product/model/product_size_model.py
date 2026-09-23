from sqlalchemy import Column, Integer, ForeignKey, String
from sqlalchemy.orm import relationship
from core.database import Base


class ProductSizeModel(Base):
    __tablename__ = "productSizeTable"
    id = Column(Integer, primary_key=True, index=True)
    product_id = Column(Integer, ForeignKey("productsTable.id"), nullable=False)
    size = Column(String, nullable=False)
    stock = Column(Integer, default=0, nullable=False)
    product = relationship("ProductModel", back_populates="sizes")
