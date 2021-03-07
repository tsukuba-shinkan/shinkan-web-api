# 8. Memberships
## 8-0. Interface

```typescript
interface Membership {
  organizationID: number;
  userID: string;
  name: string;
  email: string;
  createdAt: string;
  updatedAt: string;
}
```
## 8-1. memberships.list
`GET /v2/memberships/{organizationID}`

### 8-1-a. Requirements
- システム管理権限を持つユーザ(`admin`)は制限なく実行できます。
- ログインしているユーザは自らが所属する団体の`organizationID`を指定した場合のみ実行可能です。

### 8-1-b. Responce
body: `Membership[]`

## 8-2. memberships.create
`POST /v2/memberships/{organizationID}`
### 8-2-a. Requirements
- システム管理権限を持つユーザ(`admin`)は制限なく実行できます。
- ログインしているユーザは自らが所属する団体の`organizationID`を指定した場合のみ実行可能です。

### 8-2-b. Request Body
`Membership`

以下のフィールドは指定しても無視されます。
- `organizationID`
- `createdAt`
- `updatedAt`

### 8-2-c. Responce
status: `201`
body: `Membership`

## 8-3. memberships.delete
`DELETE /v2/memberships/{organizationID}/{userID}`
### 8-3-a. Requirements
- システム管理権限を持つユーザ(`admin`)は制限なく実行できます。
- ログインしているユーザは自らが所属する団体の`organizationID`を指定した場合のみ実行可能です。

### 8-3-b. Responce
status: `204`