from sqlalchemy import (  # pyright: ignore[reportMissingImports]
    Column,
    Integer,
    String,
    Float,
    DateTime,
    ForeignKey,
)
from sqlalchemy.orm import relationship  # pyright: ignore[reportMissingImports]
from datetime import datetime
from core.database import Base
from features.gender.model import product_genders
from features.season.model import product_season
from features.style.model import product_style


class ProductModel(Base):
    __tablename__ = "productsTable"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, nullable=False)
    subTitle = Column(String, nullable=False)
    price = Column(Float, nullable=False)
    description = Column(String, nullable=False)
    brand_id = Column(Integer, ForeignKey("brandTable.id"), nullable=False)
    rate = Column(Float, nullable=False)
    discount = Column(Float, nullable=False)
    created_at = Column(DateTime, default=datetime.utcnow, nullable=False)
    views = Column(Integer, default=0, nullable=False)
    category_id = Column(Integer, ForeignKey("CategoriesTable.id"), nullable=False)
    sizes = relationship("ProductSizeModel", back_populates="product")
    orders = relationship("OrderModel", back_populates="product")
    images = relationship(
        "ProductImageModel",
        back_populates="products",
    )
    category = relationship(
        "ProductCategoryModel",
        back_populates="products",
    )
    genders = relationship(
        "ProductGenderModel", secondary=product_genders, back_populates="products"
    )
    seasons = relationship(
        "ProductSeasonModel", secondary=product_season, back_populates="products"
    )
    styles = relationship(
        "ProductStyleModel", secondary=product_style, back_populates="products"
    )
    brand = relationship("BrandModel", back_populates="products")
