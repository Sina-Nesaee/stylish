from sqlalchemy import Table, Column, Integer, ForeignKey
from core.database import Base

product_style = Table(
    "product_style",
    Base.metadata,
    Column("product_id", Integer, ForeignKey("productsTable.id"), primary_key=True),
    Column("style_id", Integer, ForeignKey("productsStyleTable.id"), primary_key=True),
)
