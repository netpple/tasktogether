# Database Schema Summary
이 문서는 실행 중인 Oracle XE에 import된 `TIMECLOUD` 스키마를 기준으로 생성했습니다.
## Files
- `db/legacy-schema.sql`: 원본 백업에 포함된 레거시 DDL 스냅샷
- `db/schema-columns.txt`: Oracle에서 추출한 테이블/컬럼 원본 목록
- 본 문서: 사람이 보기 쉬운 요약
## Tables
### TIMECLOUD_ACCESSLOG
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| V_URL | VARCHAR2 | 500 | Y |
| N_OWNER_IDX | NUMBER | 22 | Y |
| V_ACCESS_DATETIME | VARCHAR2 | 14 | Y |
| V_AGENT | VARCHAR2 | 3000 | Y |
| N_DOMAIN_IDX | NUMBER | 22 | Y |

### TIMECLOUD_ACTIVITY
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| N_TASK_IDX | NUMBER | 22 | N |
| V_DESC | VARCHAR2 | 400 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| V_EDT_DATETIME | VARCHAR2 | 14 | N |
| C_DEL_YN | CHAR | 1 | N |
| N_OWNER_IDX | NUMBER | 22 | N |
| V_START_DATETIME | VARCHAR2 | 14 | N |
| V_END_DATETIME | VARCHAR2 | 14 | N |
| C_OFF_YN | CHAR | 1 | N |
| N_DOMAIN_IDX | NUMBER | 22 | N |

### TIMECLOUD_DOMAIN
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| V_NAME | VARCHAR2 | 50 | N |
| C_OFF_YN | CHAR | 1 | N |
| C_DEL_YN | CHAR | 1 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | Y |
| V_EDT_DATETIME | VARCHAR2 | 14 | Y |

### TIMECLOUD_DOMAIN_USER
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_DOMAIN_IDX | NUMBER | 22 | N |
| N_USER_IDX | NUMBER | 22 | N |

### TIMECLOUD_FAVORITE
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| V_DESC | VARCHAR2 | 4000 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| N_OWNER_IDX | NUMBER | 22 | N |
| V_TBL_NM | VARCHAR2 | 50 | N |
| N_TBL_IDX | NUMBER | 22 | N |
| N_TASK_IDX | NUMBER | 22 | Y |
| N_SORT | NUMBER | 22 | N |
| N_DOMAIN_IDX | NUMBER | 22 | N |

### TIMECLOUD_FEEDBACK
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| V_DESC | VARCHAR2 | 4000 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| C_DEL_YN | CHAR | 1 | N |
| N_OWNER_IDX | NUMBER | 22 | N |
| N_TASK_IDX | NUMBER | 22 | Y |
| N_DOMAIN_IDX | NUMBER | 22 | N |

### TIMECLOUD_FILE
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| N_TASK_IDX | NUMBER | 22 | N |
| V_ORIGIN_NAME | VARCHAR2 | 2000 | N |
| V_SAVE_NAME | VARCHAR2 | 2000 | N |
| V_EXT | VARCHAR2 | 50 | N |
| N_OWNER_IDX | NUMBER | 22 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| N_DOWNLOAD_COUNT | NUMBER | 22 | Y |
| N_FILE_SIZE | NUMBER | 22 | Y |
| C_DEL_YN | CHAR | 1 | N |
| N_DOMAIN_IDX | NUMBER | 22 | N |

### TIMECLOUD_NOTIFICATION
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| V_DESC | VARCHAR2 | 4000 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| V_CHK_DATETIME | VARCHAR2 | 14 | Y |
| N_CREATOR_IDX | NUMBER | 22 | N |
| N_OWNER_IDX | NUMBER | 22 | N |
| V_TBL_NM | VARCHAR2 | 50 | N |
| N_TBL_IDX | NUMBER | 22 | N |
| N_TASK_IDX | NUMBER | 22 | Y |
| C_CHK_YN | CHAR | 1 | Y |
| N_DOMAIN_IDX | NUMBER | 22 | N |

### TIMECLOUD_OBSERVER
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| V_DESC | VARCHAR2 | 4000 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| C_DEL_YN | CHAR | 1 | N |
| N_OWNER_IDX | NUMBER | 22 | N |
| N_TASK_IDX | NUMBER | 22 | N |
| N_DOMAIN_IDX | NUMBER | 22 | N |

### TIMECLOUD_PROJECT
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| N_TASK_IDX | NUMBER | 22 | N |
| V_DESC | VARCHAR2 | 400 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| V_EDT_DATETIME | VARCHAR2 | 14 | N |
| C_DEL_YN | CHAR | 1 | N |
| N_OWNER_IDX | NUMBER | 22 | N |
| V_START_DATETIME | VARCHAR2 | 14 | N |
| V_END_DATETIME | VARCHAR2 | 14 | N |
| C_OFF_YN | CHAR | 1 | N |
| C_STATUS | CHAR | 2 | N |
| N_DOMAIN_IDX | NUMBER | 22 | N |

### TIMECLOUD_TASK
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| N_PARENT_IDX | NUMBER | 22 | N |
| N_LIST | NUMBER | 22 | N |
| N_LEVEL | NUMBER | 22 | N |
| N_RIDX | NUMBER | 22 | N |
| V_DESC | VARCHAR2 | 400 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| V_EDT_DATETIME | VARCHAR2 | 14 | N |
| C_DEL_YN | CHAR | 1 | N |
| N_OWNER_IDX | NUMBER | 22 | N |
| C_OFF_YN | CHAR | 1 | N |
| C_STATUS | CHAR | 2 | N |
| C_TASK_TYPE | CHAR | 10 | N |
| V_HIDE | CHAR | 1 | Y |
| N_DOMAIN_IDX | NUMBER | 22 | N |

### TIMECLOUD_TEAM
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| V_NAME | VARCHAR2 | 50 | N |
| C_DEL_YN | CHAR | 1 | N |
| C_OFF_YN | CHAR | 1 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| V_EDT_DATETIME | VARCHAR2 | 14 | N |
| N_DOMAIN_IDX | NUMBER | 22 | N |

### TIMECLOUD_TEAM_USER
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_TEAM_IDX | NUMBER | 22 | N |
| N_USER_IDX | NUMBER | 22 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| N_DOMAIN_IDX | NUMBER | 22 | N |

### TIMECLOUD_USER
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| V_EMAIL | VARCHAR2 | 100 | N |
| V_PASSWD | VARCHAR2 | 32 | N |
| V_NAME | VARCHAR2 | 100 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| V_EDT_DATETIME | VARCHAR2 | 24 | N |
| C_DEL_YN | CHAR | 1 | N |
| C_OFF_YN | CHAR | 1 | N |
| V_TEL | VARCHAR2 | 150 | Y |
| V_NOTI_EMAIL | VARCHAR2 | 100 | Y |
| V_LAST_LOGIN_DATETIME | VARCHAR2 | 14 | Y |

### TIMECLOUD_USER_IMAGE
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_IDX | NUMBER | 22 | N |
| V_ORIGIN_NAME | VARCHAR2 | 2000 | N |
| V_SAVE_NAME | VARCHAR2 | 2000 | N |
| V_EXT | VARCHAR2 | 50 | N |
| N_OWNER_IDX | NUMBER | 22 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | N |
| N_FILE_SIZE | NUMBER | 22 | Y |
| C_DEL_YN | CHAR | 1 | N |
| C_SELECTED_YN | CHAR | 1 | N |

### TIMECLOUD_USER_PARTNER
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_OWNER_IDX | NUMBER | 22 | N |
| N_PARTNER_IDX | NUMBER | 22 | N |
| V_REG_DATETIME | VARCHAR2 | 14 | Y |

### TIMECLOUD_USER_SNSMAP
| Column | Type | Length | Nullable |
|---|---|---:|:---:|
| N_OWNER_IDX | NUMBER | 22 | N |
| C_SNS_TYPE | CHAR | 2 | N |
| V_ACCESS_TOKEN | VARCHAR2 | 500 | Y |
| V_REG_DATETIME | VARCHAR2 | 14 | Y |

