from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from core.database import Base


class ProductImageModel(Base):
    __tablename__ = "productImagesTable"

    id = Column(Integer, primary_key=True, index=True)
    image_url = Column(String, nullable=False)
    product_id = Column(Integer, ForeignKey("productsTable.id"), nullable=False)
    products = relationship("ProductModel", back_populates="images")
