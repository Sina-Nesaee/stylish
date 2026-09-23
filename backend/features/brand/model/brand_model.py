from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from core.database import Base


class BrandModel(Base):
    __tablename__ = "brandTable"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    products = relationship("ProductModel", back_populates="brand")
