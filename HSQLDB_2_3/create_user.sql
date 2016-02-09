--------------------------------------------------------
-- Copyright 2009-2016, Acciente LLC
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

-- create oacc user:
CREATE USER "oaccuser" PASSWORD 'oaccpwd';

-- grant sequence privileges:
GRANT USAGE ON SEQUENCE OACC.OAC_ResourceClassID TO "oaccuser";
GRANT USAGE ON SEQUENCE OACC.OAC_PermissionID TO "oaccuser";
GRANT USAGE ON SEQUENCE OACC.OAC_DomainID TO "oaccuser";
GRANT USAGE ON SEQUENCE OACC.OAC_ResourceID TO "oaccuser";

-- grant table privileges:
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_ResourceClass TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_ResourceClassPermission TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Domain TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Resource TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_ResourcePassword TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_ResourceExternalId TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Grant_DomPerm_Sys TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Grant_DomCrPerm_Sys TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Grant_DomCrPerm_PostCr_Sys TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Grant_ResCrPerm_Sys TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Grant_ResCrPerm_PostCr TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Grant_ResPerm TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Grant_ResPerm_Sys TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Grant_Global_ResPerm TO "oaccuser";
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE OACC.OAC_Grant_Global_ResPerm_Sys TO "oaccuser";