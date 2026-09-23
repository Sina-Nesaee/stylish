from pydantic import BaseModel, Field


class ProductImageCreate(BaseModel):
    image_url: str


class ProductImageUpdate(BaseModel):
    image_url: str | None = None


class ProductImageResponse(BaseModel):
    id: int
    image_url: str
