from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from core.database import get_db
from ..service import (
    get_address_service,
    get_address_by_id_service,
    create_address_service,
    delete_address_service,
    update_address_service,
)
from ..schema import AddressCreate, AddressResponse, AddressUpdate

router = APIRouter()


@router.get("/", response_model=list[AddressResponse])
def get_address_router(db: Session = Depends(get_db)):
    return get_address_service(db)


@router.get("/{address_id}", response_model=AddressResponse)
def get_address_by_id_router(address_id: int, db: Session = Depends(get_db)):
    return get_address_by_id_service(db, address_id)


@router.post("/", status_code=201)
def create_address_router(address: AddressCreate, db: Session = Depends(get_db)):
    return create_address_service(db, address)


@router.patch("/{user_id}", response_model=AddressResponse)
def update_address_router(
    user_id: int, data: AddressUpdate, db: Session = Depends(get_db)
):
    return update_address_service(db, user_id, data)


@router.delete("/{user_id}", status_code=204)
def delete_address_router(user_id: int, db: Session = Depends(get_db)):
    return delete_address_service(db, user_id)
