# Stage 1: Build
FROM node:18-slim AS builder
WORKDIR /app
COPY package.json ./
RUN yarn install && yarn cache clean
COPY . .
RUN yarn build

# Stage 2: Serve
FROM node:18-slim AS runner
WORKDIR /app
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/public ./public
RUN yarn install --production
EXPOSE 3000
CMD ["yarn", "start"]
