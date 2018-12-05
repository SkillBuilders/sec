CREATE OR REPLACE 
PACKAGE sec_util IS
--
--
-- Purpose: To provide all the utilities for the APEX application module SEC
--
-- MODIFICATION HISTORY
-- Person                            Date        Comments
-- --------------------------------- ----------  ------------------------------------------
-- Garry Lawton - Skillbuilders Inc. 12/03/2018  Creation
--
   FUNCTION custom_hash(p_username IN VARCHAR2, p_password IN VARCHAR2) RETURN VARCHAR2;
   PROCEDURE set_password(p_username IN VARCHAR2, p_password IN VARCHAR2);
   FUNCTION custom_auth(p_username IN VARCHAR2, p_password IN VARCHAR2) RETURN BOOLEAN;
   FUNCTION get_user_id(p_username IN VARCHAR2) RETURN NUMBER;
   FUNCTION get_roles_granted(p_user_id IN NUMBER) RETURN VARCHAR2;
   PROCEDURE set_roles_granted(p_user_id IN NUMBER, p_roles_granted IN VARCHAR2);
   FUNCTION user_in_role(p_username IN VARCHAR2, p_role IN VARCHAR2) RETURN BOOLEAN;
   FUNCTION user_in_role2(p_username IN VARCHAR2, p_role IN VARCHAR2) RETURN VARCHAR2;
   FUNCTION get_notification_users RETURN VARCHAR2;
   PROCEDURE send_users_password(p_username IN VARCHAR2);
   PROCEDURE send_notification(p_to IN VARCHAR2, p_subject IN VARCHAR2, p_message IN VARCHAR2);

   PROCEDURE init;

END sec_util;
/


