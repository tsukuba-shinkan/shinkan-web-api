# 9. Invitations
## 9-0. Interface

```typescript
interface Invitation {
  invitationID: number;
  email: string;
  organizationID: string;
  createdAt: string;
  updatedAt: string:
}
```
## 9-1. invitations.list
`GET /v2/invitations`
### 9-1-a. Requirements
- システム管理権限を持つユーザ(`admin`)は制限なく実行できます。
- ログインしているユーザは自らが所属する団体の情報のみ取得可能です。

### 9-1-b. Query Parameters
| key |  | default | type | description |
|---|---|---|---|---|
| `organizationID` | Optional | N/A | `number` | 団体IDで絞り込みをする際に指定します。

### 9-1-c. Responce
body: `Invitation[]`

## 9-2 invitations.get
`GET /v2/invitations/{ID}`
### 9-2-a. Requirements
- システム管理権限を持つユーザ(`admin`)は制限なく実行できます。
- ログインしているユーザは自らが所属する団体の招待のみ参照可能です。

### 9-2-b. Responce
body: `Invitation`

## 9-3. invitations.create
`POST /v2/invitations`
### 9-3-a. Requirements
- システム管理権限を持つユーザ(`admin`)は制限なく実行できます。
- ログインしているユーザは自らが所属する団体にのみ招待可能です。

### 9-3-b. Request Body
`Invitation`

以下のフィールドは指定しても無視されます。
- `invitationID`
- `createdAt`
- `updatedAt`

## 9-4. invitations.delete
`DELETE /v2/invitations/{ID}`
### 9-4-a. Requirements
- システム管理権限を持つユーザ(`admin`)は制限なく実行できます。
- ログインしているユーザは自らが所属する団体の招待に対してのみ実行可能です。

### 9-4-b. Responce
status: `204`
