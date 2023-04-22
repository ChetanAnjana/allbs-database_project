import React, { useState } from 'react';
import './uploadProductScreen.css';

const UploadProductScreen = () => {
  const [productName, setProductName] = useState('');
  const [productDescription, setProductDescription] = useState('');
  const [productPrice, setProductPrice] = useState(0);
  const [productImage, setProductImage] = useState(null);

  const handleProductNameChange = (event) => {
    setProductName(event.target.value);
  };

  const handleProductDescriptionChange = (event) => {
    setProductDescription(event.target.value);
  };

  const handleProductPriceChange = (event) => {
    setProductPrice(event.target.value);
  };

  const handleProductImageChange = (event) => {
    setProductImage(event.target.files[0]);
  };

  const handleUploadProduct = () => {
    // handle uploading product to server
    console.log({
      productName,
      productDescription,
      productPrice,
      productImage,
    });
  };

  return (
    <div className="upload-product-screen">
      <h1>Upload Product</h1>
      <form>
        <label htmlFor="productName">Product Name:</label>
        <input
          type="text"
          id="productName"
          name="productName"
          value={productName}
          onChange={handleProductNameChange}
        />
        <br />
        <label htmlFor="productDescription">Product Description:</label>
        <textarea
          id="productDescription"
          name="productDescription"
          value={productDescription}
          onChange={handleProductDescriptionChange}
        ></textarea>
        <br />
        <label htmlFor="productPrice">Product Price:</label>
        <input
          type="number"
          id="productPrice"
          name="productPrice"
          value={productPrice}
          onChange={handleProductPriceChange}
        />
        <br />
        <label htmlFor="productImage">Product Image:</label>
        <input
          type="file"
          id="productImage"
          name="productImage"
          onChange={handleProductImageChange}
        />
        <br />
        <button
          type="button"
          className="yellow-button"
          onClick={handleUploadProduct}
        >
          Upload Product
        </button>
      </form>
    </div>
  );
};

export default UploadProductScreen;
