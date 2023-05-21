DROP database if exists OnAirAuction;

create database if not exists OnAirAuction;

use OnAirAuction;

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(20)	NOT NULL,
	`me_pw`	varchar(255) NOT NULL,
	`me_email`	varchar(50) NOT NULL,
    	`me_post_num` varchar(70) NOT NULL,
    	`me_road_name` varchar(70) NOT NULL,
    	`me_detail_address` varchar(70) NOT NULL,
	`me_phone`	varchar(20)	NOT NULL,
	`me_name`	varchar(20)	NOT NULL,
	`me_birth`	date NOT NULL,
	`me_certification`	int default 0 NULL,
	`me_authority`	int default 0 NULL,
	`me_account`	varchar(30)	NULL,
    	`me_complation_number` int default 0 NULL,
    	`me_reported_number` int default 0 NULL,
	`me_join_time`	datetime	NULL,
	`me_region`	varchar(100)	NULL,
	`me_customer_certification`	varchar(20)	NULL,
	`me_session_id`	varchar(255)	NULL,
	`me_session_limit`	datetime	NULL,
	`me_ml_name`	varchar(20)	 NULL
);

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
	`pr_code`	int auto_increment	NOT NULL primary key,
	`pr_name`	varchar(100) NOT NULL,
	`pr_intro`	longtext NOT NULL,
	`pr_condition`	varchar(30)	NOT NULL,
	`pr_detail`	longtext NOT NULL,
	`pr_location`	varchar(100) NOT NULL,
	`pr_refund_ok`	varchar(100) NOT NULL,
	`pr_refund_date`	varchar(100) NOT NULL,
	`pr_refund_reason`	longtext NOT NULL,
	`pr_state`	varchar(20) default '시작전'	NULL,
	`pr_start_price`	int	NOT NULL,
	`pr_origin`	varchar(50)	NOT NULL,
	`pr_size`	varchar(100) NOT NULL,
	`pr_st_num`	int	NOT NULL,
	`pr_pc_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `auction`;

CREATE TABLE `auction` (
	`au_num`	int auto_increment	NOT NULL primary key,
	`au_calculation`	int	NOT NULL,
	`au_limit_bid_time`	int default 0	NULL,
	`au_start_date`	datetime NOT NULL,
	`au_final_date`	datetime NULL,
	`au_extension`	int default 0	NULL,
	`au_faild`	int default 0	NULL,
	`au_immediate`	int	NULL,
	`au_limit_level`	int default 0	NULL,
	`au_delivery_way`	varchar(20)	NOT NULL,
	`au_pr_code`	int	NOT NULL,
	`au_me_id`	varchar(20)	NOT NULL,
	`au_ac_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `auction_join`;

CREATE TABLE `auction_join` (
	`aj_au_num`	int	NOT NULL,
	`aj_me_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `product_like`;

CREATE TABLE `product_like` (
	`pl_pr_code`	int	NOT NULL,
	`pl_me_id`	varchar(20)	NOT NULL,
	`pl_state`	int	NULL
);

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
	`re_num`	int auto_increment	NOT NULL primary key,
	`re_title`	varchar(100) NOT NULL,
	`re_content`	longtext NOT NULL,
	`re_satisfaction`	int	NOT NULL,
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
	`pmc_num`	int auto_increment	NOT NULL primary key,
	`pmc_name`	varchar(50)	NOT NULL,
	`pmc_plc_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `product_small_category`;

CREATE TABLE `product_small_category` (
	`psc_num`	int auto_increment	NOT NULL primary key,
	`psc_name`	varchar(50)	NOT NULL,
	`psc_pmc_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
	`pc_num`	int auto_increment	NOT NULL primary key,
	`pc_name`	varchar(50)	NOT NULL,
	`pc_psc_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `auction_category`;

CREATE TABLE `auction_category` (
	`ac_num`	int auto_increment	NOT NULL primary key,
	`ac_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `delivery`;

CREATE TABLE `delivery` (
	`de_num`	int auto_increment	NOT NULL primary key,
	`de_state`	varchar(20)	default '배송전' NULL,
	`de_start_date`	datetime NOT NULL,
	`de_complete_date`	datetime NOT NULL,
	`de_ao_num`	int	NOT NULL,
	`de_bl_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `inquiry`;

CREATE TABLE `inquiry` (
	`in_num`	int auto_increment	NOT NULL primary key,
	`in_title`	varchar(100) NOT NULL,
	`in_content`	longtext NOT NULL,
	`in_register_date`	datetime NOT NULL,
	`in_modify_date`	datetime	NULL,
	`in_answer_date`	datetime	NULL,
	`in_answer_content`	longtext	NULL,
	`in_me_id`	varchar(20)	NOT NULL,
	`in_pr_code`	int NULL,
	`in_ic_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
	`st_num`	int auto_increment	NOT NULL primary key,
	`st_name`	varchar(20)	NOT NULL,
	`st_intro`	longtext NOT NULL,
	`st_me_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `inquiry_category`;

CREATE TABLE `inquiry_category` (
	`ic_num`	int auto_increment	NOT NULL primary key,
	`ic_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `chatting`;

CREATE TABLE `chatting` (
	`ch_num`	int auto_increment	NOT NULL primary key,
	`ch_au_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `chatting_record`;

CREATE TABLE `chatting_record` (
	`cr_num`	int auto_increment	NOT NULL primary key,
	`cr_content`	longtext NOT NULL,
	`cr_time`	datetime NOT NULL,
	`cr_me_id`	varchar(20)	NOT NULL,
	`cr_ch_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `auction_order`;

CREATE TABLE `auction_order` (
	`ao_num`	int auto_increment	NOT NULL primary key,
	`ao_me_id`	varchar(20)	NOT NULL,
	`ao_au_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `refund`;

CREATE TABLE `refund` (
	`re_num`	int auto_increment	NOT NULL primary key,
	`re_apply_date`	datetime NOT NULL,
	`re_reason`	longtext NOT NULL,
	`re_confirm_date`	datetime	NULL,
	`re_progress`	varchar(20) default '심사중' NULL,
	`re_ao_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `auction_cancel`;

CREATE TABLE `auction_cancel` (
	`ac_num`	int auto_increment	NOT NULL primary key,
	`ac_date`	datetime NOT NULL,
	`ac_reason`	longtext NOT NULL,
	`ac_au_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `report_category`;

CREATE TABLE `report_category` (
	`rc_num`	int auto_increment	NOT NULL primary key,
	`rc_name`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
	`re_num`	int auto_increment	NOT NULL primary key,
	`re_content`	longtext NOT NULL,
	`re_date`	datetime NOT NULL,
	`re_result`	varchar(10) default '처리전'	NULL,
	`re_report_id`	varchar(20)	NULL,
	`re_report_product`	varchar(50)	NULL,
	`re_me_id`	varchar(20)	NOT NULL,
	`re_rc_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `limited_auction`;

CREATE TABLE `limited_auction` (
	`la_num`	int auto_increment	NOT NULL primary key,
	`la_limited_number`	int	NOT NULL,
	`la_apply_start_time`	datetime NOT NULL,
	`la_apply_final_time`	datetime NOT NULL,
	`la_au_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `virtual_account`;

CREATE TABLE `virtual_account` (
	`va_me_id`	varchar(20)	NOT NULL,
	`va_holding_amount`	int	default 0 NULL,
	`va_pw`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `auction_record`;

CREATE TABLE `auction_record` (
	`ar_num`	int auto_increment	NOT NULL primary key,
	`ar_bid_time`	datetime NOT NULL,
	`ar_bid_price`	int	NOT NULL,
	`ar_me_id`	varchar(20)	NOT NULL,
	`ar_au_num`	int	NOT NULL
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
	`fi_name`	varchar(255) NOT NULL,
	`fi_save_name`	varchar(255) NOT NULL,
	`fi_table_name`	varchar(50)	NOT NULL,
	`fi_table_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `seller_like`;

CREATE TABLE `seller_like` (
	`sl_me_id`	varchar(20)	NOT NULL,
	`sl_seller_id`	varchar(20)	NOT NULL,
	`sl_state`	int	NULL
);

DROP TABLE IF EXISTS `rating_standard`;

CREATE TABLE `rating_standard` (
	`rs_ml_name`	varchar(20)	NOT NULL,
	`rs_standard_condition`	varchar(100) NOT NULL
);

DROP TABLE IF EXISTS `board_list`;

CREATE TABLE `board_list` (
	`bl_num`	int auto_increment	NOT NULL primary key,
	`bl_name`	varchar(30)	NOT NULL,
	`bl_post_num` varchar(70) NOT NULL,
    	`bl_road_name` varchar(70) NOT NULL,
    	`bl_detail_address` varchar(70) NOT NULL,
	`bl_me_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `bidding_unit`;

CREATE TABLE `bidding_unit` (
	`bu_unit`	int	NOT NULL,
	`bu_condition`	varchar(50)	NOT NULL
);

DROP TABLE IF EXISTS `charge`;

CREATE TABLE `charge` (
	`ch_num`	int auto_increment	NOT NULL primary key,
	`ch_method`	varchar(30)	NOT NULL,
	`ch_amount`	int	NOT NULL,
	`ch_charge_date`	datetime NOT NULL,
    `ch_va_me_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `withdraw`;

CREATE TABLE `withdraw` (
	`wi_num`	int auto_increment	NOT NULL primary key,
	`wi_amount`	int NOT NULL,
	`wi_withdraw_date`	datetime NOT NULL,
	`wi_withdraw_reason`	varchar(50) NOT NULL,
    	`wi_va_me_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
	`me_num`	int auto_increment	NOT NULL primary key,
	`me_time`	datetime NOT NULL,
	`me_read_time`	datetime	NULL,
	`me_send_id`	varchar(20)	NOT NULL,
	`me_receive_id`	varchar(20)	NOT NULL,
	`me_title`	varchar(50)	NOT NULL,
	`me_content`	longtext NOT NULL
);

DROP TABLE IF EXISTS `certification`;

CREATE TABLE `certification` (
	`ce_me_id`	varchar(20)	NOT NULL,
	`ce_certification_number`	varchar(10)	NULL,
	`ce_time`	datetime	NULL
);

DROP TABLE IF EXISTS `chatting_attend`;

CREATE TABLE `chatting_attend` (
	`ca_ch_num`	int	NOT NULL,
    	`ca_me_id`	varchar(20)	NOT NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_id`
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


ALTER TABLE `certification` ADD CONSTRAINT `PK_CERTIFICATION` PRIMARY KEY (
	`ce_me_id`
);

ALTER TABLE `member` ADD CONSTRAINT `FK_membership_level_TO_member_1` FOREIGN KEY (
	`me_ml_name`
)
REFERENCES `membership_level` (
	`ml_name`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_store_TO_product_1` FOREIGN KEY (
	`pr_st_num`
)
REFERENCES `store` (
	`st_num`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_product_category_TO_product_1` FOREIGN KEY (
	`pr_pc_num`
)
REFERENCES `product_category` (
	`pc_num`
);

ALTER TABLE `auction` ADD CONSTRAINT `FK_product_TO_auction_1` FOREIGN KEY (
	`au_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `auction` ADD CONSTRAINT `FK_member_TO_auction_1` FOREIGN KEY (
	`au_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `auction` ADD CONSTRAINT `FK_auction_category_TO_auction_1` FOREIGN KEY (
	`au_ac_num`
)
REFERENCES `auction_category` (
	`ac_num`
);

ALTER TABLE `auction_join` ADD CONSTRAINT `FK_auction_TO_auction_join_1` FOREIGN KEY (
	`aj_au_num`
)
REFERENCES `auction` (
	`au_num`
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
	`psc_pmc_num`
)
REFERENCES `product_middle_category` (
	`pmc_num`
);

ALTER TABLE `product_category` ADD CONSTRAINT `FK_product_small_category_TO_product_category_1` FOREIGN KEY (
	`pc_psc_num`
)
REFERENCES `product_small_category` (
	`psc_num`
);

ALTER TABLE `delivery` ADD CONSTRAINT `FK_auction_order_TO_delivery_1` FOREIGN KEY (
	`de_ao_num`
)
REFERENCES `auction_order` (
	`ao_num`
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

ALTER TABLE `inquiry` ADD CONSTRAINT `FK_product_TO_inquiry_1` FOREIGN KEY (
	`in_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `inquiry` ADD CONSTRAINT `FK_inquiry_category_TO_inquiry_1` FOREIGN KEY (
	`in_ic_num`
)
REFERENCES `inquiry_category` (
	`ic_num`
);

ALTER TABLE `store` ADD CONSTRAINT `FK_member_TO_store_1` FOREIGN KEY (
	`st_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `chatting` ADD CONSTRAINT `FK_auction_TO_chatting_1` FOREIGN KEY (
	`ch_au_num`
)
REFERENCES `auction` (
	`au_num`
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

ALTER TABLE `auction_order` ADD CONSTRAINT `FK_member_TO_auction_order_1` FOREIGN KEY (
	`ao_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `auction_order` ADD CONSTRAINT `FK_auction_TO_auction_order_1` FOREIGN KEY (
	`ao_au_num`
)
REFERENCES `auction` (
	`au_num`
);

ALTER TABLE `refund` ADD CONSTRAINT `FK_auction_order_TO_refund_1` FOREIGN KEY (
	`re_ao_num`
)
REFERENCES `auction_order` (
	`ao_num`
);

ALTER TABLE `auction_cancel` ADD CONSTRAINT `FK_auction_TO_auction_cancel_1` FOREIGN KEY (
	`ac_au_num`
)
REFERENCES `auction` (
	`au_num`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_member_TO_report_1` FOREIGN KEY (
	`re_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `report` ADD CONSTRAINT `FK_report_category_TO_report_1` FOREIGN KEY (
	`re_rc_num`
)
REFERENCES `report_category` (
	`rc_num`
);

ALTER TABLE `limited_auction` ADD CONSTRAINT `FK_auction_TO_limited_auction_1` FOREIGN KEY (
	`la_au_num`
)
REFERENCES `auction` (
	`au_num`
);

ALTER TABLE `virtual_account` ADD CONSTRAINT `FK_member_TO_virtual_account_1` FOREIGN KEY (
	`va_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `charge` ADD CONSTRAINT `FK_virtual_account_TO_charge_1` FOREIGN KEY (
	`ch_va_me_id`
)
REFERENCES `virtual_account` (
	`va_me_id`
);

ALTER TABLE `withdraw` ADD CONSTRAINT `FK_virtual_account_TO_withdraw_1` FOREIGN KEY (
	`wi_va_me_id`
)
REFERENCES `virtual_account` (
	`va_me_id`
);


ALTER TABLE `auction_record` ADD CONSTRAINT `FK_member_TO_auction_record_1` FOREIGN KEY (
	`ar_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `auction_record` ADD CONSTRAINT `FK_auction_TO_auction_record_1` FOREIGN KEY (
	`ar_au_num`
)
REFERENCES `auction` (
	`au_num`
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

ALTER TABLE `certification` ADD CONSTRAINT `FK_member_TO_certification_1` FOREIGN KEY (
	`ce_me_id`
)
REFERENCES `member` (
	`me_id`
);


ALTER TABLE `chatting_attend` ADD CONSTRAINT `FK_chatting_TO_chatting_attend_1` FOREIGN KEY (
	`ca_ch_num`
)
REFERENCES `chatting` (
	`ch_num`
);

ALTER TABLE `chatting_attend` ADD CONSTRAINT `FK_member_TO_chatting_attend_1` FOREIGN KEY (
	`ca_me_id`
)
REFERENCES `member` (
	`me_id`
);
