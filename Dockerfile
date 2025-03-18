# Use Node.js LTS (Long Term Support) version
FROM node:20-slim

# Set working directory
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy package files first for better caching
COPY package.json ./

# Create pnpm-lock.yaml if it doesn't exist
RUN pnpm install --lockfile-only

# Install all dependencies (including devDependencies for build)
RUN pnpm install

# Copy the rest of the application
COPY . .

# Generate types and build the application
RUN pnpm run typecheck
RUN NODE_ENV=production pnpm run build

# List the contents of build directory for debugging
RUN ls -la build || true
RUN ls -la build/server || true

# Expose the server port
EXPOSE 3000

# Start the production server with explicit node command
CMD ["node", "build/server/index.js"] 