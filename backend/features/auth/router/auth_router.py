from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from core.database import get_db
from ..schema import LoginRequest, TokenResponse
from ..service import login_service

router = APIRouter(prefix="/auth", tags=["Auth"])


@router.post("/login", response_model=TokenResponse)
def login_router(login_data: LoginRequest, db: Session = Depends(get_db)):
    access_token = login_service(db, login_data)
    if access_token is None:
        raise HTTPException(status_code=401, detail="Invalid email or password")
    return {"access_token": access_token, "token_type": "bearer"}
