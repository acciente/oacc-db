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
-- DB2 typically uses OS authentication, which means that in DB2
-- a user has to be created externally to the database first!
-- this script only grants the user 'rsfuser' privileges to the rsf items

-- if using a dedicated database - grant database privileges:

GRANT CONNECT ON DATABASE TO USER rsfuser;

-- grant sequence privileges:

GRANT USAGE ON SEQUENCE RSF.RSF_ResourceClassID TO rsfuser;
GRANT USAGE ON SEQUENCE RSF.RSF_PermissionID TO rsfuser;
GRANT USAGE ON SEQUENCE RSF.RSF_DomainID TO rsfuser;
GRANT USAGE ON SEQUENCE RSF.RSF_ResourceID TO rsfuser;

-- grant table privileges:
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_ResourceClass TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_ResourceClassPermission TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Domain TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Resource TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Grant_DomPerm_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Grant_DomCrPerm_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Grant_DomCrPerm_PostCr_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Grant_ResCrPerm_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Grant_ResCrPerm_PostCr TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Grant_ResCrPerm_PostCr_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Grant_ResPerm TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Grant_ResPerm_Sys TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Grant_Global_ResPerm TO rsfuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE RSF.RSF_Grant_Global_ResPerm_Sys TO rsfuser;
