import React from "react";
import { ListGroup } from "react-bootstrap";

import { CATEGORIES } from "../../consts/consts";

function CategoriesList({ handleCategoryClick }) {
  const categories = Object.values(CATEGORIES);

  return (
    <ListGroup
      style={{
        width: "18rem",
        marginRight: "1rem",
        marginBottom: "1rem",
        padding: 0,
      }}
    >
      {categories.map((category) => {
        return (
          <ListGroup.Item
            action
            style={{ textTransform: "uppercase" }}
            key={category}
            onClick={() => handleCategoryClick(category)}
          >
            {category}
          </ListGroup.Item>
        );
      })}
    </ListGroup>
  );
}

export default CategoriesList;
