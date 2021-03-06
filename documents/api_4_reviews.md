# 4. Reviews

## 4-0. Interface

```typescript=
interface Review {
}
```
## 4-1. reviews.list

## 4-2. reviews.get

## 4-3. reviews.create

`POST /v2/reviews`

### 4-3-a. Requirements

レビュアー権限またはシステム管理権限を持つユーザーのみが使用できます。

### 4-3-b. Request Body

`Review`

### 4-3-c. Response

status: `201`

## 4-4. reviews.update

`PUT /v2/reviews/{ID}` 



### 4-4-a. Requirements

レビュアー権限またはシステム管理権限を持つユーザーのみが使用できます。

### 4-2-b. Query Parameters

| key |  | default | type | description |
|---|---|---|---|---|

### 4-4-c. Request Body

### 4-4-d. Response

## 4-5. reviews.delete
`DELETE /v2/reviews/{ID}`

