from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.orm import relationship

from core.database import Base


class UserModel(Base):
    __tablename__ = "userstable"
    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, nullable=False)
    password_hash = Column(String, nullable=False)
    is_active = Column(Boolean, default=True)
    # role = Column(String, default="user", nullable=False)
    profile = relationship("ProfileModel", back_populates="user", uselist=False)
    adress = relationship("AdressModel", back_populates="user")
    bank_account = relationship("BankAccountsModel", back_populates="user")
