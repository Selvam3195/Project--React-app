# Stage 3: Serve the React Application with Nginx
FROM nginx:alpine as production
# Copy the built React app from the builder stage
COPY /dist /usr/share/nginx/html
# (Optional) Copy a custom Nginx configuration file if you need more control
# COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
