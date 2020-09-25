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
-- テーブルの構造 `organizations`
--

CREATE TABLE `organizations` (
  `organization_id` int(32) NOT NULL,
  `organization_name` varchar(64) NOT NULL,
  `organization_type` varchar(16) NOT NULL,
  `activity_type` varchar(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `organization_contents`
--

CREATE TABLE `organization_contents` (
  `organization_id` int(32) NOT NULL,
  `activity_introduction` mediumtext DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `is_published` bit(1) NOT NULL DEFAULT b'0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `organization_contents_image`
--

CREATE TABLE `organization_contents_image` (
  `image_id` int(32) NOT NULL,
  `organization_id` int(32) NOT NULL,
  `image_filename` varchar(255) NOT NULL,
  `image_type` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- テーブルの構造 `organization_members`
--

CREATE TABLE `organization_members` (
  `user_id` varchar(36) NOT NULL,
  `organization_id` int(32) NOT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのインデックス
--

--
-- テーブルのインデックス `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`organization_id`);

--
-- テーブルのインデックス `organization_contents`
--
ALTER TABLE `organization_contents`
  ADD PRIMARY KEY (`organization_id`);

--
-- テーブルのインデックス `organization_contents_image`
--
ALTER TABLE `organization_contents_image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `organization_id` (`organization_id`);

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
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `organization_contents_image`
--
ALTER TABLE `organization_contents_image`
  MODIFY `image_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `organization_member_invitations`
--
ALTER TABLE `organization_member_invitations`
  MODIFY `invitation_id` int(32) NOT NULL AUTO_INCREMENT;

--
-- テーブルの制約
--

--
-- テーブルの制約 `organization_contents_image`
--
ALTER TABLE `organization_contents_image`
  ADD CONSTRAINT `organization_contents_image_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`);

--
-- テーブルの制約 `organization_members`
--
ALTER TABLE `organization_members`
  ADD CONSTRAINT `organization_members_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`);

--
-- テーブルの制約 `organization_member_invitations`
--
ALTER TABLE `organization_member_invitations`
  ADD CONSTRAINT `organization_member_invitations_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
