CREATE DATABASE shinkan_web;
use shinkan_web;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+09:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `shinkan_web_api`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(32) NOT NULL,
  `announcement_title` varchar(64) NOT NULL,
  `announcement_content` mediumtext DEFAULT NULL,
  `is_published` bit(1) NOT NULL DEFAULT b'0',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `organizations`
--

CREATE TABLE `organizations` (
  `organization_id` int(32) NOT NULL,
  `organization_name` varchar(64) NOT NULL,
  `organization_type` enum('課外活動団体','一般学生団体','その他') NOT NULL,
  `activity_type` enum('体育系','芸術系','文化系','その他') NOT NULL,
  `is_admin` bit(1) NOT NULL DEFAULT b'0',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `organization_events`
--

CREATE TABLE `organization_events` (
  `event_id` int(32) NOT NULL,
  `organization_id` int(32) NOT NULL,
  `event_name` varchar(64) NOT NULL,
  `event_detail` mediumtext DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `status` enum('draft','submitted','rejected','published') NOT NULL DEFAULT 'draft',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `organization_introductions`
--

CREATE TABLE `organization_introductions` (
  `introduction_id` int(32) NOT NULL,
  `organization_id` int(32) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `activity_introduction` mediumtext DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `status` enum('draft','submitted','rejected','published') NOT NULL DEFAULT 'draft',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `organization_introductions_images`
--

CREATE TABLE `organization_introductions_images` (
  `image_id` int(32) NOT NULL,
  `introduction_id` int(32) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `image_type` enum('main_image','other_image') NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `organization_introductions_youtube_links`
--

CREATE TABLE `organization_introductions_youtube_links` (
  `youtube_link_id` int(32) NOT NULL,
  `introduction_id` int(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `organization_members`
--

CREATE TABLE `organization_members` (
  `user_id` varchar(128) NOT NULL,
  `organization_id` int(32) NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `organization_member_invitations`
--

CREATE TABLE `organization_member_invitations` (
  `invitation_id` int(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `organization_id` int(32) NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `pages`
--

CREATE TABLE `pages` (
  `page_id` int(32) NOT NULL,
  `page_title` varchar(64) NOT NULL,
  `page_slug` varchar(64) NOT NULL,
  `page_content` mediumtext DEFAULT NULL,
  `is_published` bit(1) NOT NULL DEFAULT b'0',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(32) NOT NULL,
  `content_type` enum('introduction','event') NOT NULL,
  `content_id` int(32) NOT NULL,
  `result` enum('published','rejected') NOT NULL,
  `reason` mediumtext DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `user_id` varchar(128) NOT NULL,
  `name` varchar(64) NOT NULL,
  `authority` enum('general','reviewer','admin') NOT NULL DEFAULT 'general',
  `is_deleted` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`);

--
-- テーブルのインデックス `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`organization_id`);

--
-- テーブルのインデックス `organization_events`
--
ALTER TABLE `organization_events`
  ADD PRIMARY KEY (`event_id`);

--
-- テーブルのインデックス `organization_introductions`
--
ALTER TABLE `organization_introductions`
  ADD PRIMARY KEY (`introduction_id`);

--
-- テーブルのインデックス `organization_introductions_images`
--
ALTER TABLE `organization_introductions_images`
  ADD PRIMARY KEY (`image_id`);

--
-- テーブルのインデックス `organization_introductions_youtube_links`
--
ALTER TABLE `organization_introductions_youtube_links`
  ADD PRIMARY KEY (`youtube_link_id`);

--
-- テーブルのインデックス `organization_members`
--
ALTER TABLE `organization_members`
  ADD PRIMARY KEY (`user_id`,`organization_id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- テーブルのインデックス `organization_member_invitations`
--
ALTER TABLE `organization_member_invitations`
  ADD PRIMARY KEY (`invitation_id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- テーブルのインデックス `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- テーブルのインデックス `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `organization_events`
--
ALTER TABLE `organization_events`
  MODIFY `event_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `organization_introductions`
--
ALTER TABLE `organization_introductions`
  MODIFY `introduction_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `organization_introductions_images`
--
ALTER TABLE `organization_introductions_images`
  MODIFY `image_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `organization_introductions_youtube_links`
--
ALTER TABLE `organization_introductions_youtube_links`
  MODIFY `youtube_link_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(32) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
