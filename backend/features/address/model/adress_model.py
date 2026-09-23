from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.orm import relationship
from core.database import Base


class AdressModel(Base):
    __tablename__ = "adressesTable"
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("userstable.id"), nullable=False)
    adress = Column(String, nullable=False)
    city = Column(String, nullable=False)
    state = Column(String, nullable=False)
    country = Column(String, nullable=False)
    pincode = Column(Integer, nullable=False)
    user = relationship("UserModel", back_populates="adress")
