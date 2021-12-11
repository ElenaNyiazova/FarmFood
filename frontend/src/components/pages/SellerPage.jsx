import React from "react";
import { useParams } from "react-router-dom";

import { useSelector } from "react-redux";
import { selectSellerById } from "../../store/sellersSlice";
import { selectProductsBySellerId } from "../../store/productsSlice";

export const SellerPage = () => {
  let { id } = useParams();
  console.log(id);
  const sellerInfo = useSelector((state) => selectSellerById(state, id));
  const sellersProducts = useSelector((state) =>
    selectProductsBySellerId(state, id)
  );
  console.log(sellerInfo);
  console.log(sellersProducts);
  return <div>Seller</div>;
};
