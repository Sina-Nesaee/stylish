from pydantic import BaseModel, Field


class ProductSizeCreate(BaseModel):
    size: str
    stock: int = Field(ge=0)


class ProductSizeUpdate(BaseModel):
    size: str | None = None
    stock: int | None = Field(default=None, ge=0)


class ProductSizeResponse(BaseModel):
    id: int
    size: str
    stock: int = Field(ge=0)
