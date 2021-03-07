# 7. Users
## 7-0. Interface

```typescript
interface User {
  userID: string;
  name: string;
  authority: string;
  email: string;
  organizationID: number[];
  createdAt: string;
  updatedAt: string;
}
```
## 7-1. users.list
`GET /v2/users`
### 7-1-a. Requirements
- 管理者権限を持っているユーザー(`admin`)のみ実行可能。

### 7-1-b. Query Parameters
| key |  | default | type | description |
|---|---|---|---|---|
| `authority` | Optinal | N/A | `string` | 特定の権限を持っているユーザーのみの一覧取得をする際に指定します。
| `organizationID` | Optinal | N/A | `number` | ある団体に所属しているユーザーの一覧を取得する際に指定します。
| `email` | Optional | N/A | `string` | ユーザーのメールアドレスから検索します。

### 7-1-c. Responce
body: `User[]`

## 7-2. users.get
`GET /v2/users/{ID}`
### 7-2-a. Requirements
- システム管理権限を持つユーザ(`admin`)は制限なく実行できます。
- ログインしているユーザは自らの`ID`を指定した場合のみ実行可能です。

### 7-2-b. Responce
body: `User`

## 7-3. users.create
`POST /v2/users`
### 7-3-a. Request Body
`User`

以下のフィールドは指定しても無視されます。
- `authority`
- `email`
- `organizationID`
- `createdAt`
- `updatedAt`

## 7-4. users.update
`PUT /v2/users/{ID}`
### 7-4-a. Requirements
- システム管理権限を持つユーザ(`admin`)はいかなる`ID`に対しても実行可能です。
- ログイン済みのユーザーは自らの`ID`に対してのみ実行可能です。
- `authority`を指定できるのはシステム管理権限を持つユーザ(`admin`)のみです。

### 7-4-b. Request Body
`User`

以下のフィールドは指定しても無視されます。
- `authority` (**`admin`は指定可**)
- `email`
- `organizationID`
- `createdAt`
- `updatedAt`

## 7-5. users.delete
`DELETE /v2/users/{ID}`
### 7-5-a. Requirements
- システム管理権限を持つユーザ(`admin`)はいかなる`ID`に対しても実行可能です。
- ログイン済みのユーザーは自らの`ID`に対してのみ実行可能です。

### 7-5-b. Responce
status: `204`
