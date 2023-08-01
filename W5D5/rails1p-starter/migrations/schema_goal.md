# Schema Goal

## `users`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | bigint    | not null, primary key          |
| `username`         | string    | not null                       |
| `password`         | string    | not null                       |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

## `videos`
| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | bigint    | not null, primary key          |
| `title`            | string    | not null                       |
| `description`      | text      | not null                       |
| `uploader_id`      | bigint    | not null, indexed, foreign key |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

## `comments`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | bigint    | not null, primary key          |
| `body`             | string    | not null                       |
| `video_id`         | bigint    | not null, indexed, foreign key |
| `commenter_id`     | bigint    | not null, indexed, foreign key |
| `parent_comment_id`| bigint    | indexed, foreign key           |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |