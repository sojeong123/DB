CREATE TABLE `accommodation` (
	`accommodation_id`	CHAR(10)	NOT NULL,
	`;lus_zone_id`	CHAR(6)	NOT NULL,
	`category_id`	CHAR(6)	NOT NULL,
	`grade_id`	CHAR(6)	NOT NULL,
	`star`	int(1,5)	NULL,
	`corporate_number`	VARCHAR(10)	NULL
);

CREATE TABLE `category` (
	`category_id`	CHAR(6)	NOT NULL,
	`name`	VARCHAR(20)	NULL
);

CREATE TABLE `plus_zone` (
	`;lus_zone_id`	CHAR(6)	NOT NULL,
	`name`	VARCHAR(70)	NULL,
	`main_zone_id`	CHAR(6)	NOT NULL
);

CREATE TABLE `main_zone` (
	`main_zone_id`	CHAR(6)	NOT NULL,
	`name`	VARCHAR(70)	NULL
);

CREATE TABLE `grade` (
	`grade_id`	CHAR(6)	NOT NULL,
	`grade`	VARCHAR(5)	NULL
);

CREATE TABLE `accommodation_image` (
	`accommodation_image_id`	CHAR(10)	NOT NULL,
	`accommodation_id`	CHAR(10)	NOT NULL,
	`url`	VARCHAR(400)	NULL,
	`is_main`	TINYINT(1)	NULL
);

CREATE TABLE `room` (
	`room_id`	CHAR(10)	NOT NULL,
	`accommodation_id`	CHAR(10)	NOT NULL,
	`room_name`	VARCHAR(20)	NULL,
	`room_people`	INT	NULL,
	`room_price`	INT	NULL
);

CREATE TABLE `room_image` (
	`room_image_id`	CHAR(10)	NOT NULL,
	`room_type_id`	CHAR(10)	NOT NULL,
	`room_image_url`	VARCHAR(400)	NULL,
	`is_main`	TINYINT(1)	NULL
);

CREATE TABLE `accommodation_tag` (
	`accommodation_id`	CHAR(10)	NOT NULL,
	`tag_id`	CHAR(10)	NOT NULL
);

CREATE TABLE `tag` (
	`tag_id`	CHAR(10)	NOT NULL,
	`tag_name`	VARCHAR(20)	NULL
);

CREATE TABLE `reservation` (
	`reservation_id`	VARCHAR(15)	NOT NULL,
	`reservation_price`	INT	NULL,
	`reservation_status`	VARCHAR(20)	NULL,
	`reservation_checkin`	DATE	NULL,
	`reservation_checkout`	DATE	NULL,
	`accommodation_id`	CHAR(10)	NOT NULL,
	`user_id`	CHAR(10)	NOT NULL,
	`pay_success_id`	VARCHAR(15)	NOT NULL,
	`pay_status_id`	CHAR(10)	NOT NULL,
	`discount_id`	CHAR(10)	NOT NULL
);

CREATE TABLE `user` (
	`user_id`	CHAR(10)	NOT NULL,
	`password`	VARCHAR(15)	NULL,
	`name`	VARCHAR(20)	NULL,
	`create_date`	DATE	NULL,
	`point`	INT	NULL,
	`coupon`	INT	NULL
);

CREATE TABLE `user_info` (
	`user_id`	CHAR(10)	NOT NULL,
	`account`	TEXT	NULL,
	`phone`	INT	NULL,
	`user_email`	VARCHAR(20)	NULL,
	`email_check`	TINTINT(1)	NULL,
	`user_image_url`	VARCHAR(400)	NULL,
	`user_gender`	char(10)	NULL,
	`user_explain`	TEXT	NULL,
	`user_birth`	DATE	NULL,
	`user_country`	char(10)	NULL,
	`user_currency`	char(10)	NULL,
	`superhost`	TINTINT(1)	NULL,
	`user_login`	char(10)	NULL
);

CREATE TABLE `pay` (
	`pay_success_id`	VARCHAR(15)	NOT NULL,
	`pay_price`	INT	NULL,
	`pay_method_id`	CHAR(10)	NOT NULL
);

CREATE TABLE `pay_method` (
	`pay_method_id`	CHAR(10)	NOT NULL,
	`pay_method`	VARCHAR(20)	NULL
);

CREATE TABLE `pay_cancel` (
	`pay_success_id`	VARCHAR(15)	NOT NULL,
	`is_cancel`	TINYINT(1)	NULL,
	`cancel_fee`	INT	NULL,
	`is_refund`	TINYINT(1)	NULL,
	`refund_price`	INT	NULL,
	`cancel_reason_id`	CHAR(10)	NOT NULL
);

CREATE TABLE `cancel_reason` (
	`cancel_reason_id`	CHAR(10)	NOT NULL,
	`cancel_reason`	VARCHAR(20)	NULL
);

CREATE TABLE `pay_status` (
	`pay_status_id`	CHAR(10)	NOT NULL,
	`pay_status`	VARCHAR(20)	NULL,
	`pay_check`	TINTINT(1)	NULL
);

CREATE TABLE `discount` (
	`discount_id`	CHAR(10)	NOT NULL,
	`discount`	VARCHAR(20)	NULL
);

CREATE TABLE `room_info` (
	`room_id`	CHAR(10)	NOT NULL,
	`room_explain`	TEXT	NULL,
	`room_country`	char(10)	NULL,
	`room_city`	char(10)	NULL,
	`room_address`	VARCHAR(70)	NULL,
	`room_bedroom`	INT	NULL,
	`room_bed`	INT	NULL,
	`room_bathroom`	INT	NULL,
	`checkin_time`	TIME	NULL,
	`checkout_time`	TIME	NULL,
	`is_check`	TINTINT(1)	NULL
);

CREATE TABLE `review` (
	`review_id`	CHAR(10)	NOT NULL,
	`review_text`	TEXT	NULL,
	`review_talking`	int(1,5)	NULL,
	`review_location`	int(1,5)	NULL,
	`review_checkin`	int(1,5)	NULL,
	`review_kind`	int(1,5)	NULL,
	`review_clean`	int(1,5)	NULL,
	`review_facility`	int(1,5)	NULL,
	`user_id`	CHAR(10)	NOT NULL,
	`room_id`	CHAR(10)	NOT NULL
);

ALTER TABLE `accommodation` ADD CONSTRAINT `PK_ACCOMMODATION` PRIMARY KEY (
	`accommodation_id`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`category_id`
);

ALTER TABLE `plus_zone` ADD CONSTRAINT `PK_PLUS_ZONE` PRIMARY KEY (
	`;lus_zone_id`
);

ALTER TABLE `main_zone` ADD CONSTRAINT `PK_MAIN_ZONE` PRIMARY KEY (
	`main_zone_id`
);

ALTER TABLE `grade` ADD CONSTRAINT `PK_GRADE` PRIMARY KEY (
	`grade_id`
);

ALTER TABLE `accommodation_image` ADD CONSTRAINT `PK_ACCOMMODATION_IMAGE` PRIMARY KEY (
	`accommodation_image_id`
);

ALTER TABLE `room` ADD CONSTRAINT `PK_ROOM` PRIMARY KEY (
	`room_id`
);

ALTER TABLE `room_image` ADD CONSTRAINT `PK_ROOM_IMAGE` PRIMARY KEY (
	`room_image_id`
);

ALTER TABLE `accommodation_tag` ADD CONSTRAINT `PK_ACCOMMODATION_TAG` PRIMARY KEY (
	`accommodation_id`,
	`tag_id`
);

ALTER TABLE `tag` ADD CONSTRAINT `PK_TAG` PRIMARY KEY (
	`tag_id`
);

ALTER TABLE `reservation` ADD CONSTRAINT `PK_RESERVATION` PRIMARY KEY (
	`reservation_id`
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `user_info` ADD CONSTRAINT `PK_USER_INFO` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `pay` ADD CONSTRAINT `PK_PAY` PRIMARY KEY (
	`pay_success_id`
);

ALTER TABLE `pay_method` ADD CONSTRAINT `PK_PAY_METHOD` PRIMARY KEY (
	`pay_method_id`
);

ALTER TABLE `pay_cancel` ADD CONSTRAINT `PK_PAY_CANCEL` PRIMARY KEY (
	`pay_success_id`
);

ALTER TABLE `cancel_reason` ADD CONSTRAINT `PK_CANCEL_REASON` PRIMARY KEY (
	`cancel_reason_id`
);

ALTER TABLE `pay_status` ADD CONSTRAINT `PK_PAY_STATUS` PRIMARY KEY (
	`pay_status_id`
);

ALTER TABLE `discount` ADD CONSTRAINT `PK_DISCOUNT` PRIMARY KEY (
	`discount_id`
);

ALTER TABLE `room_info` ADD CONSTRAINT `PK_ROOM_INFO` PRIMARY KEY (
	`room_id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`review_id`
);

ALTER TABLE `accommodation_tag` ADD CONSTRAINT `FK_accommodation_TO_accommodation_tag_1` FOREIGN KEY (
	`accommodation_id`
)
REFERENCES `accommodation` (
	`accommodation_id`
);

ALTER TABLE `accommodation_tag` ADD CONSTRAINT `FK_tag_TO_accommodation_tag_1` FOREIGN KEY (
	`tag_id`
)
REFERENCES `tag` (
	`tag_id`
);

ALTER TABLE `user_info` ADD CONSTRAINT `FK_user_TO_user_info_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `pay_cancel` ADD CONSTRAINT `FK_pay_TO_pay_cancel_1` FOREIGN KEY (
	`pay_success_id`
)
REFERENCES `pay` (
	`pay_success_id`
);

ALTER TABLE `room_info` ADD CONSTRAINT `FK_room_TO_room_info_1` FOREIGN KEY (
	`room_id`
)
REFERENCES `room` (
	`room_id`
);

