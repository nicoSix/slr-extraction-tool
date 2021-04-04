import axios from 'axios';
import { API_URL } from './config';

import auth from './authentication';

export function getPropertiesNames(cname) {
  return axios.get(`${API_URL}/properties_names/${cname}`, auth.getAuthHeaders())
    .then((data) => auth.handleResponse(data))
    .catch((error) => {
      auth.handleResponse(error.response);
    });
}

export function getPropertyValues(pkey) {
  return axios.get(`${API_URL}/properties_values/${pkey}`, auth.getAuthHeaders())
    .then((data) => auth.handleResponse(data))
    .catch((error) => {
      auth.handleResponse(error.response);
    });
}

export function saveProperty(property) {
  return axios.post(`${API_URL}/property`, property, auth.getAuthHeaders())
    .then((data) => auth.handleResponse(data))
    .catch((error) => {
      auth.handleResponse(error.response);
    });
}

export function deleteProperty(propertyId) {
  return axios.delete(`${API_URL}/property/${propertyId}`, auth.getAuthHeaders())
    .then((data) => auth.handleResponse(data))
    .catch((error) => {
      auth.handleResponse(error.response);
    });
}
