// src/axios.js
import axios from 'axios';

export const axiosInstance = axios.create({
  baseURL: 'http://localhost/gestio_basquet/api/routes'
});