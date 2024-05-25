// src/axios.js
import axios from 'axios';

const axiosInstance = axios.create({
  baseURL: 'http://localhost/gestio_basquet/api/routes/'
});

export default axiosInstance;
