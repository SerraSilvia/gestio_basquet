// src/axios.js
import axios from 'axios';

const axiosInstance = axios.create({
  baseURL: 'http://localhost/gestio_basquet'
});

export default axiosInstance;