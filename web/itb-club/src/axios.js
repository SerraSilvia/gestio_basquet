// src/axios.js
import axios from 'axios';

const axiosInstance = axios.create({
  baseURL: 'http://apiitbclub-env.eba-jkyv4asm.us-east-1.elasticbeanstalk.com/'
});

export default axiosInstance;
