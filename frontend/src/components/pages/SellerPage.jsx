import React from "react";
import { useParams } from "react-router-dom";

import { useSelector } from "react-redux";
import { selectSellerById } from "../../store/sellersSlice";

export const SellerPage = () => {
  let { id } = useParams();
  console.log(id);
  const sellerInfo = useSelector((state) => selectSellerById(state, id));
  console.log(sellerInfo);
  return <div>Seller</div>;
};
