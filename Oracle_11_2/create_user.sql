--------------------------------------------------------
-- Copyright 2009-2014, Acciente LLC
--
-- Acciente LLC licenses this file to you under the
-- Apache License, Version 2.0 (the "License"); you
-- may not use this file except in compliance with the
-- License. You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in
-- writing, software distributed under the License is
-- distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
-- OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing
-- permissions and limitations under the License.
--------------------------------------------------------

-- create rsf user:
CREATE USER rsfuser
  IDENTIFIED BY rsfpwd
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp
  PROFILE default
  QUOTA UNLIMITED ON users;

GRANT CREATE SESSION TO rsfuser;

-- grant sequence privileges:
GRANT SELECT ON RSF.RSF_ResourceClassID TO rsfuser;
GRANT SELECT ON RSF.RSF_PermissionID TO rsfuser;
GRANT SELECT ON RSF.RSF_DomainID TO rsfuser;
GRANT SELECT ON RSF.RSF_ResourceID TO rsfuser;

-- grant table privileges:
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_ResourceClass TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_ResourceClassPermission TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Domain TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Resource TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Grant_DomPerm_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Grant_DomCrPerm_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Grant_DomCrPerm_PostCr_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Grant_ResCrPerm_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Grant_ResCrPerm_PostCr TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Grant_ResCrPerm_PostCr_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Grant_ResPerm TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Grant_ResPerm_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Grant_Global_ResPerm TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON RSF.RSF_Grant_Global_ResPerm_Sys TO rsfuser;
