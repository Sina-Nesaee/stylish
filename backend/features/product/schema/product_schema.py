from pydantic import BaseModel, Field, ConfigDict
from datetime import datetime
from .product_images_schema import (
    ProductImageCreate,
    ProductImageUpdate,
    ProductImageResponse,
)
from .product_size_schema import (
    ProductSizeUpdate,
    ProductSizeResponse,
    ProductSizeCreate,
)
from ...brand.schema import BrandResponse
from ...style.schema import StyleResponse
from ...season.schema import SeasonResponse
from ...gender.schema import GenderResponse
from ...category.schema import CategoryResponse


class ProductCreate(BaseModel):
    title: str = Field(min_length=2, max_length=100)
    subTitle: str = Field(min_length=5, max_length=1000)
    price: float = Field(ge=0)
    description: str = Field(min_length=10, max_length=10000)
    rate: float = Field(ge=0, le=5)
    discount: float = Field(ge=0, le=100)
    brand_id: int
    category_id: int
    images: list[ProductImageCreate]
    genders_id: list[int]
    seasons_id: list[int]
    styles_id: list[int]
    sizes: list[ProductSizeCreate]


class ProductResponse(BaseModel):
    id: int
    title: str
    subTitle: str
    price: float
    description: str
    rate: float
    discount: float
    brand: BrandResponse
    category: CategoryResponse
    images: list[ProductImageResponse]
    genders: list[GenderResponse]
    seasons: list[SeasonResponse]
    styles: list[StyleResponse]
    sizes: list[ProductSizeResponse]
    views: int
    created_at: datetime
    model_config = ConfigDict(from_attributes=True)


class ProductUpdate(BaseModel):
    title: str | None = Field(default=None, min_length=2, max_length=100)
    subtitle: str | None = Field(default=None, min_length=5, max_length=1000)
    price: float | None = Field(default=None, ge=0)
    description: str | None = Field(default=None, min_length=10, max_length=10000)
    rate: float | None = Field(default=None, ge=0, le=5)
    discount: float | None = Field(default=None, ge=0, le=100)
    brand_id: int | None = None
    category_id: int | None = None
    images: list[ProductImageUpdate] | None = None
    genders_id: list[int] | None = None
    seasons_id: list[int] | None = None
    styles_id: list[int] | None = None
    sizes: list[ProductSizeUpdate] | None = None
