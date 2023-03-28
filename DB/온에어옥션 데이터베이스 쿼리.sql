DROP database if exists OnAirAuction;

create database if not exists OnAirAuction;

use OnAirAuction;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(20)	NOT NULL,
	`me_pw`	varchar(30)	NOT NULL,
	`me_email`	varchar(50)	NOT NULL,
	`me_board`	varchar(100) NOT NULL,
	`me_phone`	varchar(20)	NOT NULL,
	`me_name`	varchar(20)	NOT NULL,
	`me_birth`	date NOT NULL,
	`me_certification`	int default 0 NOT NULL,
	`me_authority`	int default 0 NOT NULL,
	`me_account`	varchar(30)	NOT NULL,
	`me_region`	varchar(100) NOT NULL,
    `me_join_time` datetime NUll,
	`me_ml_name`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
	`pr_code`	int auto_increment	NOT NULL primary key, -- auto increment의 경우 여기서 프라이머키 지정쿼리를 써줘야 함
	`pr_name`	varchar(100) NOT NULL,
	`pr_intro`	longtext NOT NULL,
	`pr_condition`	varchar(30)	NOT NULL,
	`pr_detail`	longtext NOT NULL,
	`pr_location`	varchar(100) NOT NULL,
	`pr_refundreason`	longtext NOT NULL,
	`pr_startprice`	int	NOT NULL,
	`pr_origin`	varchar(50)	NOT NULL,
	`pr_size`	varchar(100) NOT NULL,
	`pr_pc_psc_pmc_plc_num`	int	NOT NULL,
	`pr_st_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `auction`;

CREATE TABLE `auction` (
	`ac_num`	int auto_increment	NOT NULL primary key,
	`ac_estimate`	int NOT	NULL,
	`ac_calculation`	int NOT	NULL,
	`ac_bidtime`	datetime NOT NULL,
	`ac_startdate`	datetime NOT NULL,
	`ac_finaldate`	datetime NOT NULL,
	`ac_extension`	int	default 0 NOT NULL,
	`ac_faild`	int default	0 NOT NULL,
	`ac_immediate`	int	 NOT NULL,
	`ac_limitlevel`	int	default 0 NOT NULL,
	`ac_state`	varchar(20)	 NOT NULL,
	`ac_deliveryway`	varchar(20)	NOT NULL,
	`ac_pr_code`	int	NOT NULL,
	`ac_me_id`	varchar(20)	NOT NULL,
	`ac_ac_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `auction_join`;

CREATE TABLE `auction_join` (
	`aj_ac_num`	int	NOT NULL,
	`aj_me_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `product_like`;

CREATE TABLE `product_like` (
	`pl_pr_code`	int	NOT NULL,
	`pl_me_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
	`re_num`	int auto_increment	NOT NULL primary key,
	`re_title`	varchar(100) NOT NULL,
	`re_content`	longtext NOT NULL,
	`re_level`	int	default 0 NOT NULL,
	`re_registration`	datetime NOT NULL,
	`re_modify`	datetime	NULL,
	`re_st_num`	int	NOT NULL,
	`re_ar_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `product_large_category`;

CREATE TABLE `product_large_category` (
	`plc_num`	int auto_increment	NOT NULL primary key,
	`plc_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `product_middle_category`;

CREATE TABLE `product_middle_category` (
	`pmc_plc_num`	int	NOT NULL,
	`pmc_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `product_small_category`;

CREATE TABLE `product_small_category` (
	`psc_pmc_plc_num`	int	NOT NULL,
	`psc_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
	`pc_psc_pmc_plc_num`	int	NOT NULL,
	`pc_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `auction_category`;

CREATE TABLE `auction_category` (
	`ac_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `delivery`;

CREATE TABLE `delivery` (
	`de_num`	int auto_increment	NOT NULL primary key,
	`de_state`	varchar(20)	NOT NULL,
	`de_startdate`	datetime NULL,
	`de_completedate`	datetime NULL,
	`de_or_num`	int	NOT NULL,
	`de_bl_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `inquiry`;

CREATE TABLE `inquiry` (
	`in_num`	int auto_increment	NOT NULL primary key,
	`in_title`	varchar(100) NOT NULL,
	`in_content`	longtext NOT NULL,
	`in_registerdate`	datetime NOT NULL,
	`in_modifydate`	datetime	NULL,
	`in_answerdate`	datetime	NULL,
	`in_answercontent`	longtext	NULL,
	`in_me_id`	varchar(20)	NOT NULL,
	`in_ic_name`	varchar(50)	NOT NULL,
	`in_pr_code`	int	NOT NULL
);

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
	`st_num`	int auto_increment	NOT NULL primary key,
	`st_name`	varchar(20)	NOT NULL,
	`st_me_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `inquiry_category`;

CREATE TABLE `inquiry_category` (
	`ic_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `chatting`;

CREATE TABLE `chatting` (
	`ch_num`	int auto_increment	NOT NULL primary key,
	`ch_ac_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `chatting_record`;

CREATE TABLE `chatting_record` (
	`cr_me_id`	varchar(20)	NOT NULL,
	`cr_ch_num`	int	NOT NULL,
	`cr_content`	longtext NOT NULL,
	`cr_time`	datetime NOT NULL
);

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
	`or_num`	int auto_increment	NOT NULL primary key,
	`or_me_id`	varchar(20)	NOT NULL,
	`or_ac_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `refund`;

CREATE TABLE `refund` (
	`re_num`	int auto_increment	NOT NULL primary key,
	`re_applydate`	datetime NOT NULL,
	`re_reason`	longtext NOT NULL,
	`re_confirmdate`	datetime	NULL,
	`re_progress`	varchar(20)	NOT NULL,
	`re_or_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `auction_cancel`;

CREATE TABLE `auction_cancel` (
	`ac_num`	int auto_increment	NOT NULL primary key,
	`ac_date`	datetime NOT NULL,
	`ac_reason`	longtext NOT NULL,
	`ac_ac_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `report_category`;

CREATE TABLE `report_category` (
	`rc_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
	`re_num`	int auto_increment	NOT NULL primary key,
	`re_content`	longtext NOT NULL,
	`re_date`	datetime NOT NULL,
	`re_result`	varchar(10)	NOT NULL,
	`re_me_id`	varchar(20)	NOT NULL,
	`re_rc_name`	varchar(50)	NOT NULL,
	`re_report_id`	varchar(20)	NOT NULL,
	`re_pr_code`	int	NOT NULL
);

DROP TABLE IF EXISTS `limited_auction`;

CREATE TABLE `limited_auction` (
	`la_num`	int auto_increment	NOT NULL primary key,
	`la_limitednumber`	int	NOT NULL,
	`la_applystarttime`	datetime	NOT NULL,
	`la_applyfinaltime`	datetime	NOT NULL,
	`la_ac_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `virtual_account`;

CREATE TABLE `virtual_account` (
	`va_me_id`	varchar(20)	NOT NULL,
	`va_holdingamount`	int	default 0 NOT NULL,
	`va_chargedate`	datetime NULL,
	`va_withdrawdate`	datetime NULL,
	`va_pw`	varchar(50)	NOT NULL,
	`va_ch_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `auction_record`;

CREATE TABLE `auction_record` (
	`ar_num`	int auto_increment	NOT NULL primary key,
	`ar_bidtime`	datetime	NOT NULL,
	`ar_bidprice`	int	NOT NULL,
	`ar_me_id`	varchar(20)	NOT NULL,
	`ar_ac_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `membership_level`;

CREATE TABLE `membership_level` (
	`ml_name`	varchar(20)	NOT NULL,
	`ml_expense`	int	NOT NULL
);

DROP TABLE IF EXISTS `auction_apply`;

CREATE TABLE `auction_apply` (
	`aa_la_num`	int	NOT NULL,
	`aa_me_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
	`fi_num`	int auto_increment	NOT NULL primary key,
	`fi_name`	varchar(255)	NOT NULL,
	`fi_savename`	varchar(255)	NOT NULL,
	`fi_tablename`	varchar(50)	NOT NULL,
	`fi_tablenum`	int	NOT NULL
);

DROP TABLE IF EXISTS `seller_like`;

CREATE TABLE `seller_like` (
	`sl_me_id`	varchar(20)	NOT NULL,
	`sl_seller_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `rating_standard`;

CREATE TABLE `rating_standard` (
	`rs_ml_name`	varchar(20)	NOT NULL,
	`rs_complationnumber`	int default 0	NOT NULL,
	`rs_reportnumber`	int default 0	NOT NULL
);

DROP TABLE IF EXISTS `board_list`;

CREATE TABLE `board_list` (
	`bl_num`	int auto_increment	NOT NULL primary key,
	`bl_name`	varchar(30)	NOT NULL,
	`bl_board`	varchar(100)	NOT NULL,
	`bl_me_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `bidding_unit`;

CREATE TABLE `bidding_unit` (
	`bu_unit`	int	NOT NULL
);

DROP TABLE IF EXISTS `standard`;

CREATE TABLE `standard` (
	`st_bu_unit`	int	NOT NULL,
	`st_range`	varchar(70)	NOT NULL
);

DROP TABLE IF EXISTS `charge`;

CREATE TABLE `charge` (
	`ch_num`	int auto_increment	NOT NULL primary key,
	`ch_method`	varchar(30)	NOT NULL,
	`ch_amount`	int	NOT NULL
);

DROP TABLE IF EXISTS `note_box`;

CREATE TABLE `note_box` (
	`nb_num`	int auto_increment	NOT NULL primary key,
	`nb_sendtime`	datetime	NOT NULL,
	`nb_readtime`	datetime	NULL,
	`nb_sendid`	varchar(20)	NOT NULL,
	`nb_receiveid`	varchar(20)	NOT NULL,
	`nb_title`	varchar(50)	NOT NULL,
	`nb_content`	longtext	NOT NULL
);

DROP TABLE IF EXISTS `certification`;

CREATE TABLE `certification` (
	`ce_me_id`	varchar(20)	NOT NULL,
	`ce_certificationnumber`	varchar(10)	NOT NULL,
	`ce_time`	datetime	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_id`
);



ALTER TABLE `product_middle_category` ADD CONSTRAINT `PK_PRODUCT_MIDDLE_CATEGORY` PRIMARY KEY (
	`pmc_plc_num`
);

ALTER TABLE `product_small_category` ADD CONSTRAINT `PK_PRODUCT_SMALL_CATEGORY` PRIMARY KEY (
	`psc_pmc_plc_num`
);

ALTER TABLE `product_category` ADD CONSTRAINT `PK_PRODUCT_CATEGORY` PRIMARY KEY (
	`pc_psc_pmc_plc_num`
);

ALTER TABLE `auction_category` ADD CONSTRAINT `PK_AUCTION_CATEGORY` PRIMARY KEY (
	`ac_name`
);



ALTER TABLE `inquiry_category` ADD CONSTRAINT `PK_INQUIRY_CATEGORY` PRIMARY KEY (
	`ic_name`
);



ALTER TABLE `report_category` ADD CONSTRAINT `PK_REPORT_CATEGORY` PRIMARY KEY (
	`rc_name`
);


ALTER TABLE `virtual_account` ADD CONSTRAINT `PK_VIRTUAL_ACCOUNT` PRIMARY KEY (
	`va_me_id`
);


ALTER TABLE `membership_level` ADD CONSTRAINT `PK_MEMBERSHIP_LEVEL` PRIMARY KEY (
	`ml_name`
);


ALTER TABLE `rating_standard` ADD CONSTRAINT `PK_RATING_STANDARD` PRIMARY KEY (
	`rs_ml_name`
);


ALTER TABLE `bidding_unit` ADD CONSTRAINT `PK_BIDDING_UNIT` PRIMARY KEY (
	`bu_unit`
);

ALTER TABLE `standard` ADD CONSTRAINT `PK_STANDARD` PRIMARY KEY (
	`st_bu_unit`
);


ALTER TABLE `certification` ADD CONSTRAINT `PK_CERTIFICATION` PRIMARY KEY (
	`ce_me_id`
);

ALTER TABLE `member` ADD CONSTRAINT `FK_membership_level_TO_member_1` FOREIGN KEY (
	`me_ml_name`
)
REFERENCES `membership_level` (
	`ml_name`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_product_category_TO_product_1` FOREIGN KEY (
	`pr_pc_psc_pmc_plc_num`
)
REFERENCES `product_category` (
	`pc_psc_pmc_plc_num`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_store_TO_product_1` FOREIGN KEY (
	`pr_st_num`
)
REFERENCES `store` (
	`st_num`
);

ALTER TABLE `auction` ADD CONSTRAINT `FK_product_TO_auction_1` FOREIGN KEY (
	`ac_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `auction` ADD CONSTRAINT `FK_member_TO_auction_1` FOREIGN KEY (
	`ac_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `auction` ADD CONSTRAINT `FK_auction_category_TO_auction_1` FOREIGN KEY (
	`ac_ac_name`
)
REFERENCES `auction_category` (
	`ac_name`
);

ALTER TABLE `auction_join` ADD CONSTRAINT `FK_auction_TO_auction_join_1` FOREIGN KEY (
	`aj_ac_num`
)
REFERENCES `auction` (
	`ac_num`
);

ALTER TABLE `auction_join` ADD CONSTRAINT `FK_member_TO_auction_join_1` FOREIGN KEY (
	`aj_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `product_like` ADD CONSTRAINT `FK_product_TO_product_like_1` FOREIGN KEY (
	`pl_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `product_like` ADD CONSTRAINT `FK_member_TO_product_like_1` FOREIGN KEY (
	`pl_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_store_TO_review_1` FOREIGN KEY (
	`re_st_num`
)
REFERENCES `store` (
	`st_num`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_auction_record_TO_review_1` FOREIGN KEY (
	`re_ar_num`
)
REFERENCES `auction_record` (
	`ar_num`
);

ALTER TABLE `product_middle_category` ADD CONSTRAINT `FK_product_large_category_TO_product_middle_category_1` FOREIGN KEY (
	`pmc_plc_num`
)
REFERENCES `product_large_category` (
	`plc_num`
);

ALTER TABLE `product_small_category` ADD CONSTRAINT `FK_product_middle_category_TO_product_small_category_1` FOREIGN KEY (
	`psc_pmc_plc_num`
)
REFERENCES `product_middle_category` (
	`pmc_plc_num`
);

ALTER TABLE `product_category` ADD CONSTRAINT `FK_product_small_category_TO_product_category_1` FOREIGN KEY (
	`pc_psc_pmc_plc_num`
)
REFERENCES `product_small_category` (
	`psc_pmc_plc_num`
);

ALTER TABLE `delivery` ADD CONSTRAINT `FK_order_TO_delivery_1` FOREIGN KEY (
	`de_or_num`
)
REFERENCES `order` (
	`or_num`
);

ALTER TABLE `delivery` ADD CONSTRAINT `FK_board_list_TO_delivery_1` FOREIGN KEY (
	`de_bl_num`
)
REFERENCES `board_list` (
	`bl_num`
);

ALTER TABLE `inquiry` ADD CONSTRAINT `FK_member_TO_inquiry_1` FOREIGN KEY (
	`in_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `inquiry` ADD CONSTRAINT `FK_inquiry_category_TO_inquiry_1` FOREIGN KEY (
	`in_ic_name`
)
REFERENCES `inquiry_category` (
	`ic_name`
);

ALTER TABLE `inquiry` ADD CONSTRAINT `FK_product_TO_inquiry_1` FOREIGN KEY (
	`in_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `store` ADD CONSTRAINT `FK_member_TO_store_1` FOREIGN KEY (
	`st_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `chatting` ADD CONSTRAINT `FK_auction_TO_chatting_1` FOREIGN KEY (
	`ch_ac_num`
)
REFERENCES `auction` (
	`ac_num`
);

ALTER TABLE `chatting_record` ADD CONSTRAINT `FK_member_TO_chatting_record_1` FOREIGN KEY (
	`cr_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `chatting_record` ADD CONSTRAINT `FK_chatting_TO_chatting_record_1` FOREIGN KEY (
	`cr_ch_num`
)
REFERENCES `chatting` (
	`ch_num`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_member_TO_order_1` FOREIGN KEY (
	`or_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_auction_TO_order_1` FOREIGN KEY (
	`or_ac_num`
)
REFERENCES `auction` (
	`ac_num`
);

ALTER TABLE `refund` ADD CONSTRAINT `FK_order_TO_refund_1` FOREIGN KEY (
	`re_or_num`
)
REFERENCES `order` (
	`or_num`
);

ALTER TABLE `auction_cancel` ADD CONSTRAINT `FK_auction_TO_auction_cancel_1` FOREIGN KEY (
	`ac_ac_num`
)
REFERENCES `auction` (
	`ac_num`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_member_TO_report_1` FOREIGN KEY (
	`re_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_member_TO_report_2` FOREIGN KEY (
	`re_report_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_report_category_TO_report_1` FOREIGN KEY (
	`re_rc_name`
)
REFERENCES `report_category` (
	`rc_name`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_product_TO_report_1` FOREIGN KEY (
	`re_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `limited_auction` ADD CONSTRAINT `FK_auction_TO_limited_auction_1` FOREIGN KEY (
	`la_ac_num`
)
REFERENCES `auction` (
	`ac_num`
);

ALTER TABLE `virtual_account` ADD CONSTRAINT `FK_member_TO_virtual_account_1` FOREIGN KEY (
	`va_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `virtual_account` ADD CONSTRAINT `FK_charge_TO_virtual_account_1` FOREIGN KEY (
	`va_ch_num`
)
REFERENCES `charge` (
	`ch_num`
);

ALTER TABLE `auction_record` ADD CONSTRAINT `FK_member_TO_auction_record_1` FOREIGN KEY (
	`ar_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `auction_record` ADD CONSTRAINT `FK_auction_TO_auction_record_1` FOREIGN KEY (
	`ar_ac_num`
)
REFERENCES `auction` (
	`ac_num`
);

ALTER TABLE `auction_apply` ADD CONSTRAINT `FK_limited_auction_TO_auction_apply_1` FOREIGN KEY (
	`aa_la_num`
)
REFERENCES `limited_auction` (
	`la_num`
);

ALTER TABLE `auction_apply` ADD CONSTRAINT `FK_member_TO_auction_apply_1` FOREIGN KEY (
	`aa_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `seller_like` ADD CONSTRAINT `FK_member_TO_seller_like_1` FOREIGN KEY (
	`sl_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `seller_like` ADD CONSTRAINT `FK_member_TO_seller_like_2` FOREIGN KEY (
	`sl_seller_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `rating_standard` ADD CONSTRAINT `FK_membership_level_TO_rating_standard_1` FOREIGN KEY (
	`rs_ml_name`
)
REFERENCES `membership_level` (
	`ml_name`
);

ALTER TABLE `board_list` ADD CONSTRAINT `FK_member_TO_board_list_1` FOREIGN KEY (
	`bl_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `standard` ADD CONSTRAINT `FK_bidding_unit_TO_standard_1` FOREIGN KEY (
	`st_bu_unit`
)
REFERENCES `bidding_unit` (
	`bu_unit`
);

ALTER TABLE `certification` ADD CONSTRAINT `FK_member_TO_certification_1` FOREIGN KEY (
	`ce_me_id`
)
REFERENCES `member` (
	`me_id`
);

