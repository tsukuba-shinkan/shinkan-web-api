# organizations

- 団体の基礎情報を格納
- **予めこちらで登録し、基本的には変更しない**
- 主キー： organization_id

| **organization_id**                        | organization_name    | organization_type                                       | activity_type                                         | is_admin                       | is_deleted                     | created_at                                     | updated_at                                                   |
| ------------------------------------------ | -------------------- | ------------------------------------------------------- | ----------------------------------------------------- | ------------------------------ | ------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| int(32) NOT NULL                           | varchar(64) NOT NULL | enum('課外活動団体', '一般学生団体', 'その他') NOT NULL | enum('体育系', '文化系', '芸術系', 'その他') NOT NULL | bit(1) NOT   NULL DEFAULT b'0' | bit(1) NOT   NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| 団体ID<br>（既存システムで付与済みのもの） | 団体名               | 団体種別<br>（一般学生団体・課外活動団体）              | 活動種別<br>（芸術系・文化系・体育系）                | 管理用団体か否か               | 削除済みか否か                 | データ入力日時                                 | データ更新日時                                               |

# organization_introductions
- 各団体が編集するデータを格納
- 主キー： introduction_id

| introduction_id  | organization_id                            | title                      | activity_introduction | website      | twitter                 | instagram    | status                                                       | is_deleted                     | created_at                                     | updated_at                                                   |
| ---------------- | ------------------------------------------ | -------------------------- | --------------------- | ------------ | ----------------------- | ------------ | ------------------------------------------------------------ | ------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| int(32) NOT NULL | int(32) NOT NULL                           | varchar(64)                | mediamtext            | varchar(255) | varchar(255)            | varchar(255) | enum('draft', 'submitted', 'rejected',  'published') NOT NULL DEFAULT 'draft' | bit(1) NOT   NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| 紹介文等ID       | 団体ID<br>（既存システムで付与済みのもの） | キャッチコピー（20字以内） | 活動紹介              | WebサイトURL | Twitterスクリーンネーム | Instagram ID | 公開状態                                                     | 削除済みか否か                 | データ入力日時                                 | データ更新日時                                               |

# organization_introductions_images
- 各団体のメイン画像のデータ・その他画像の画像データのファイル名を格納
- 主キー：image_id (AUTO_INCREMENT)

| image_id         | introduction_id  | image_path            | image_type                                  | is_deleted                     | created_at                                     | updated_at                                                   |
| ---------------- | ---------------- | --------------------- | ------------------------------------------- | ------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| int(32) NOT NULL | int(32) NOT NULL | varchar(255) NOT NULL | enum('main_image', 'other_image')           | bit(1) NOT   NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| 画像ID           | 紹介文等ID       | ファイル名            | ファイル種別<br>（main_image, other_image） | 削除済みか否か                 | データ入力日時                                 | データ更新日時                                               |

# organization_introductions_youtube_links
- 団体詳細ページに埋め込むYouTube動画のリンク
- 主キー： youtube_link_id

| youtube_link_id  | introduction_id  | link                  | is_deleted                     | created_at                                     | updated_at                                                   |
| ---------------- | ---------------- | --------------------- | ------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| int(32) NOT NULL | int(32) NOT NULL | varchar(255) NOT NULL | bit(1) NOT   NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| リンクID         | 紹介文等ID       | リンク                | 削除済みか否か                 | データ入力日時                                 | データ更新日時                                               |

# organization_events
- 各団体のイベント情報（イベント名、イベント開始終了日時、イベント詳細）を格納
- 主キー： event_id (AUTO_INCREMENT)

| event_id         | organization_id  | event_name           | event_detail | start_date    | start_time    | end_date      | end_time       | status                                                       | is_deleted                     | created_at                                     | updated_at                                                   |
| ---------------- | ---------------- | -------------------- | ------------ | ------------- | ------------- | ------------- | -------------- | ------------------------------------------------------------ | ------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| int(32) NOT NULL | int(32) NOT NULL | varchar(64) NOT NULL | mediumtext   | date NOT NULL | time NOT NULL | date NOT NULL | time NOT  NULL | enum('draft', 'submitted', 'rejected',  'published') NOT NULL DEFAULT 'draft' | bit(1) NOT   NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| イベントID       | 団体ID           | イベント名           | イベント詳細 | 開始日        | 開始時刻      | 終了日        | 終了時刻       | 公開状態                                                     | 削除済みか否か                 | データ入力日時                                 | データ更新日時                                               |

# reviews

| review_id        | content_type                              | content_id                        | result                                 | reason                             | is_deleted                           | created_at                                     | updated_at                                                   |
| ---------------- | ----------------------------------------- | --------------------------------- | -------------------------------------- | ---------------------------------- | --- | --- | --- |
| int(32) NOT NULL | enum('introduction', 'event') NOT NULL    | int(32) NOT NULL                  | enum('published', 'rejected') NOT NULL | mediumtext  | bit(1) NOT NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| レビューID       | レビュー対象の種別（introduction, event） | レビュー対象の紹介文等/イベントID | 結果（published, rejected）            | 理由（`result=="rejected"`の場合） | 削除済みか否か                          | データ入力日時                                 | データ更新日時                                               |



# users

- ユーザ一覧（従来案ではFirebaseで全て管理しシステムでは保持しない予定だったが、権限管理の必要のため追加）
- 主キー： user_id
- general: 各団体の担当者、 reviewer:新歓祭推進委員会およびWebページ学生委員会の運用担当者、 admin: Webページ学生委員会の運用担当者、開発担当者

| user_id                        | name         | authority                                                    | is_deleted                     | created_at                                     | updated_at                                                   |
| ------------------------------ | ------------ | ------------------------------------------------------------ | ------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| varchar(128) NOT  NULL         | varchar(64)  | enum('general', 'reviewer', admin) NOT NULL DEFAULT 'general' | bit(1) NOT   NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| ユーザーID（Firebaseから付与） | 氏名(表示名) | 権限(general, reviewer, admin)                               | 削除済みか否か                 | データ入力日時                                 | データ更新日時                                               |

# organization_members
- 団体とユーザの紐付け
- 主キー： user_id, organization_id

| user_id                        | organization_id  | is_deleted                     | created_at                                     | updated_at                                                   |
| ------------------------------ | ---------------- | ------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| varchar(128) NOT  NULL         | int(32) NOT NULL | bit(1) NOT   NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| ユーザーID（Firebaseから付与） | 所属団体の団体ID | 削除済みか否か                 | データ入力日時                                 | データ更新日時                                               |

# organization_member_invitations
- 団体への招待中の未登録ユーザ

| invitation_id    | email                           | organization_id  | is_deleted                     | created_at                                     | updated_at                                                   |
| ---------------- | ------------------------------- | ---------------- | ------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| int(32) NOT NULL | varchar(255) NOT NULL           | int(32) NOT NULL | bit(1) NOT   NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| 招待ID           | メールアドレス<br>（sアドレス） | 団体ID           | 削除済みか否か                 | データ入力日時                                 | データ更新日時                                               |

# pages
- システム運用者が作成する固定ページ
- 主キー： page_id

| page_id          | page_title           | page_slug            | page_content | is_published                 | is_deleted                     | created_at                                     | updated_at                                                   |
| ---------------- | -------------------- | -------------------- | ------------ | ---------------------------- | ------------------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| int(32) NOT NULL | varchar(64) NOT NULL | varchar(64) NOT NULL | mediumtext   | bit(1) NOT NULL DEFAULT b'0' | bit(1) NOT   NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| ページID         | ページ名             | URL用slug            | ページ内容   | 公開設定                     | 削除済みか否か                 | データ入力日時                                 | データ更新日時                                               |

# announcements
- システム運用者からのお知らせ
- 主キー： announcement_id

| announcement_id  | announcement_title   | announcement_content | is_published                 | is_deleted                   | created_at                                     | updated_at                                                   |
| ---------------- | -------------------- | -------------------- | ---------------------------- | ---------------------------- | ---------------------------------------------- | ------------------------------------------------------------ |
| int(32) NOT NULL | varchar(64) NOT NULL | mediumtext           | bit(1) NOT NULL DEFAULT b'0' | bit(1) NOT NULL DEFAULT b'0' | timestamp NOT NULL DEFAULT current_timestamp() | timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() |
| お知らせID       | お知らせタイトル     | お知らせ内容         | 公開設定                     | 削除済みか否か               | データ入力日時                                 | データ更新日時                                               |