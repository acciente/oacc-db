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

/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases vV7.0.1                    */
/* Target DBMS:           Oracle 11g                                      */
/* Project file:          rsf-schema-design.dez                           */
/* Project name:          RSF                                             */
/* Author:                Adinath Raveendra Raj                           */
/* Script type:           Database creation script                        */
/* Created on:            2014-10-04 16:13                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Sequences                                                              */
/* ---------------------------------------------------------------------- */

CREATE SEQUENCE RSF.RSF_ResourceClassID
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NOMAXVALUE
    nocycle
    NOCACHE
    ORDER;

CREATE SEQUENCE RSF.RSF_PermissionID
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NOMAXVALUE
    nocycle
    NOCACHE
    order;

CREATE SEQUENCE RSF.RSF_DomainID
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NOMAXVALUE
    nocycle
    NOCACHE
    ORDER;

CREATE SEQUENCE RSF.RSF_ResourceID
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    NOMAXVALUE
    nocycle
    CACHE 10
    ORDER;

/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "RSF_ResourceClass"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_ResourceClass (
    ResourceClassID NUMBER(19) CONSTRAINT NN_RC_ResourceClassID NOT NULL,
    ResourceClassName VARCHAR2(128) CONSTRAINT NN_RC_ResourceClassName NOT NULL,
    IsAuthenticatable NUMBER(1) CONSTRAINT NN_RC_IsAuthenticatable NOT NULL,
    IsUnauthenticatedCreateAllowed NUMBER(1) CONSTRAINT NN_RC_IsUnauthdCreateAllowed NOT NULL,
    CONSTRAINT PK_RC PRIMARY KEY (ResourceClassID)
);

CREATE INDEX RSF.IX_RC_ResourceClassName ON RSF.RSF_ResourceClass (ResourceClassName);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_ResourceClassPermission"                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_ResourceClassPermission (
    ResourceClassID NUMBER(19) CONSTRAINT NN_RCP_ResourceClassID NOT NULL,
    PermissionID NUMBER(19) CONSTRAINT NN_RCP_PermissionID NOT NULL,
    PermissionName VARCHAR2(64) CONSTRAINT NN_RCP_PermissionName NOT NULL,
    CONSTRAINT PK_RCP PRIMARY KEY (ResourceClassID, PermissionID)
);

CREATE INDEX RSF.IX_RCP_ResourceClassID ON RSF.RSF_ResourceClassPermission (ResourceClassID);

CREATE INDEX RSF.IX_RCP_ResClassID_PermName ON RSF.RSF_ResourceClassPermission (ResourceClassID,PermissionName);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Domain"                                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Domain (
    DomainID NUMBER(19) CONSTRAINT NN_D_DomainID NOT NULL,
    DomainName VARCHAR2(64) CONSTRAINT NN_D_DomainName NOT NULL,
    ParentDomainID NUMBER(19),
    CONSTRAINT PK_D PRIMARY KEY (DomainID)
);

CREATE INDEX RSF.IX_D_ParentDomainID ON RSF.RSF_Domain (ParentDomainID);

CREATE INDEX RSF.IX_D_DomainName ON RSF.RSF_Domain (DomainName);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Resource"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Resource (
    ResourceID NUMBER(19) CONSTRAINT NN_R_ResourceID NOT NULL,
    ResourceClassID NUMBER(19) CONSTRAINT NN_R_ResourceClassID NOT NULL,
    Password VARCHAR2(128),
    DomainID NUMBER(19) CONSTRAINT NN_R_DomainID NOT NULL,
    CONSTRAINT PK_R PRIMARY KEY (ResourceID)
);

CREATE INDEX RSF.IX_R_ResourceClassID ON RSF.RSF_Resource (ResourceClassID);

CREATE INDEX RSF.IX_R_DomainID ON RSF.RSF_Resource (DomainID);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Grant_ResPerm"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Grant_ResPerm (
    AccessorResourceID NUMBER(19) CONSTRAINT NN_GrRP_AccessorResourceID NOT NULL,
    AccessedResourceID NUMBER(19) CONSTRAINT NN_GrRP_AccessedResourceID NOT NULL,
    ResourceClassID NUMBER(19) CONSTRAINT NN_GrRP_ResourceClassID NOT NULL,
    PermissionID NUMBER(19) CONSTRAINT NN_GrRP_PermissionID NOT NULL,
    IsWithGrant NUMBER(1) CONSTRAINT NN_GrRP_IsWithGrant NOT NULL,
    GrantorResourceID NUMBER(19) CONSTRAINT NN_GrRP_GrantorResourceID NOT NULL,
    CONSTRAINT PK_GrRP PRIMARY KEY (AccessorResourceID, AccessedResourceID, ResourceClassID, PermissionID)
);

CREATE INDEX RSF.IX_GrRP_AccessorResourceID ON RSF.RSF_Grant_ResPerm (AccessorResourceID);

CREATE INDEX RSF.IX_GrRP_AccessedResourceID ON RSF.RSF_Grant_ResPerm (AccessedResourceID);

CREATE INDEX RSF.IX_GrRP_GrantorResourceID ON RSF.RSF_Grant_ResPerm (GrantorResourceID);

CREATE INDEX RSF.IX_GrRP_ResourceClassID ON RSF.RSF_Grant_ResPerm (ResourceClassID,PermissionID);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Grant_ResCrPerm_PostCr"                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Grant_ResCrPerm_PostCr (
    AccessorResourceID NUMBER(19) CONSTRAINT NN_GrRCrPPoCr_AccessorResID NOT NULL,
    AccessedDomainID NUMBER(19) CONSTRAINT NN_GrRCrPPoCr_AccessedDomainID NOT NULL,
    ResourceClassID NUMBER(19) CONSTRAINT NN_GrRCrPPoCr_ResourceClassID NOT NULL,
    PostCreatePermissionID NUMBER(19) CONSTRAINT NN_GrRCrPPoCr_PostCrPermID NOT NULL,
    PostCreateIsWithGrant NUMBER(1) CONSTRAINT NN_GrRCrPPoCr_PostCrWithGrant NOT NULL,
    IsWithGrant NUMBER(1) CONSTRAINT NN_GrRCrPPoCr_IsWithGrant NOT NULL,
    GrantorResourceID NUMBER(19) CONSTRAINT NN_GrRCrPPoCr_GrantorResID NOT NULL,
    CONSTRAINT PK_GrRCrPPoCr PRIMARY KEY (AccessorResourceID, AccessedDomainID, ResourceClassID, PostCreatePermissionID)
);

CREATE INDEX RSF.IX_GrRCrPPoCr_ResClassID ON RSF.RSF_Grant_ResCrPerm_PostCr (ResourceClassID,PostCreatePermissionID);

CREATE INDEX RSF.IX_GrRCrPPoCr_AccessorResID ON RSF.RSF_Grant_ResCrPerm_PostCr (AccessorResourceID);

CREATE INDEX RSF.IX_GrRCrPPoCr_GrantorResID ON RSF.RSF_Grant_ResCrPerm_PostCr (GrantorResourceID);

CREATE INDEX RSF.IX_GrRCrPPoCr_AccessedDomainID ON RSF.RSF_Grant_ResCrPerm_PostCr (AccessedDomainID);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Grant_DomPerm_Sys"                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Grant_DomPerm_Sys (
    AccessorResourceID NUMBER(19) CONSTRAINT NN_GrDPSys_AccessorResourceID NOT NULL,
    AccessedDomainID NUMBER(19) CONSTRAINT NN_GrDPSys_AccessedDomainID NOT NULL,
    SysPermissionID NUMBER(19) CONSTRAINT NN_GrDPSys_SysPermissionID NOT NULL,
    IsWithGrant NUMBER(1) CONSTRAINT NN_GrDPSys_IsWithGrant NOT NULL,
    GrantorResourceID NUMBER(19) CONSTRAINT NN_GrDPSys_GrantorResourceID NOT NULL,
    CONSTRAINT PK_GrDPSys PRIMARY KEY (AccessorResourceID, AccessedDomainID, SysPermissionID)
);

CREATE INDEX RSF.IX_GrDPSys_AccessorResourceID ON RSF.RSF_Grant_DomPerm_Sys (AccessorResourceID);

CREATE INDEX RSF.IX_GrDPSys_GrantorResourceID ON RSF.RSF_Grant_DomPerm_Sys (GrantorResourceID);

CREATE INDEX RSF.IX_GrDPSys_AccessedDomainID ON RSF.RSF_Grant_DomPerm_Sys (AccessedDomainID);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Grant_DomCrPerm_PostCr_Sys"                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Grant_DomCrPerm_PostCr_Sys (
    AccessorResourceID NUMBER(19) CONSTRAINT NN_GrDCrPPoCrSys_AccessorResID NOT NULL,
    PostCreateSysPermissionID NUMBER(19) CONSTRAINT NN_GrDCrPPoCrSys_PoCrSysPermID NOT NULL,
    PostCreateIsWithGrant NUMBER(1) CONSTRAINT NN_GrDCrPPoCrSys_PoCrWithGrant NOT NULL,
    IsWithGrant NUMBER(1) CONSTRAINT NN_GrDCrPPoCrSys_IsWithGrant NOT NULL,
    GrantorResourceID NUMBER(19) CONSTRAINT NN_GrDCrPPoCrSys_GrantorResID NOT NULL,
    CONSTRAINT PK_GrDCrPPoCrSys PRIMARY KEY (AccessorResourceID, PostCreateSysPermissionID)
);

CREATE INDEX RSF.IX_GrDCrPPoCrSys_AccessorResID ON RSF.RSF_Grant_DomCrPerm_PostCr_Sys (AccessorResourceID);

CREATE INDEX RSF.IX_GrDCrPPoCrSys_GrantorResID ON RSF.RSF_Grant_DomCrPerm_PostCr_Sys (GrantorResourceID);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Grant_ResPerm_Sys"                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Grant_ResPerm_Sys (
    AccessorResourceID NUMBER(19) CONSTRAINT NN_GrRPSys_AccessorResourceID NOT NULL,
    AccessedResourceID NUMBER(19) CONSTRAINT NN_GrRPSys_AccessedResourceID NOT NULL,
    ResourceClassID NUMBER(19) CONSTRAINT NN_GrRPSys_ResourceClassID NOT NULL,
    SysPermissionID NUMBER(19) CONSTRAINT NN_GrRPSys_SysPermissionID NOT NULL,
    IsWithGrant NUMBER(1) CONSTRAINT NN_GrRPSys_IsWithGrant NOT NULL,
    GrantorResourceID NUMBER(19) CONSTRAINT NN_GrRPSys_GrantorResourceID NOT NULL,
    CONSTRAINT PK_GrRPSys PRIMARY KEY (AccessorResourceID, AccessedResourceID, ResourceClassID, SysPermissionID)
);

CREATE INDEX RSF.IX_GrRPSys_AccessorResourceID ON RSF.RSF_Grant_ResPerm_Sys (AccessorResourceID);

CREATE INDEX RSF.IX_GrRPSys_AccessedResourceID ON RSF.RSF_Grant_ResPerm_Sys (AccessedResourceID);

CREATE INDEX RSF.IX_GrRPSys_GrantorResourceID ON RSF.RSF_Grant_ResPerm_Sys (GrantorResourceID);

CREATE INDEX RSF.IX_GrRPSys_ResourceClassID ON RSF.RSF_Grant_ResPerm_Sys (ResourceClassID);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Grant_ResCrPerm_PostCr_Sys"                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Grant_ResCrPerm_PostCr_Sys (
    AccessorResourceID NUMBER(19) CONSTRAINT NN_GrRCrPPoCrSys_AccessorResID NOT NULL,
    AccessedDomainID NUMBER(19) CONSTRAINT NN_GrRCrPPoCrSys_AccessedDomID NOT NULL,
    ResourceClassID NUMBER(19) CONSTRAINT NN_GrRCrPPoCrSys_ResClassID NOT NULL,
    PostCreateSysPermissionID NUMBER(19) CONSTRAINT NN_GrRCrPPoCrSys_PoCrSysPermID NOT NULL,
    PostCreateIsWithGrant NUMBER(1) CONSTRAINT NN_GrRCrPPoCrSys_PoCrWithGrant NOT NULL,
    IsWithGrant NUMBER(1) CONSTRAINT NN_GrRCrPPoCrSys_IsWithGrant NOT NULL,
    GrantorResourceID NUMBER(19) CONSTRAINT NN_GrRCrPPoCrSys_GrantorResID NOT NULL,
    CONSTRAINT PK_GrRCrPPoCrSys PRIMARY KEY (AccessorResourceID, AccessedDomainID, ResourceClassID, PostCreateSysPermissionID)
);

CREATE INDEX RSF.IX_GrRCrPPoCrSys_AccessorResID ON RSF.RSF_Grant_ResCrPerm_PostCr_Sys (AccessorResourceID);

CREATE INDEX RSF.IX_GrRCrPPoCrSys_GrantorResID ON RSF.RSF_Grant_ResCrPerm_PostCr_Sys (GrantorResourceID);

CREATE INDEX RSF.IX_GrRCrPPoCrSys_ResClassID ON RSF.RSF_Grant_ResCrPerm_PostCr_Sys (ResourceClassID);

CREATE INDEX RSF.IX_GrRCrPPoCrSys_AccessedDomID ON RSF.RSF_Grant_ResCrPerm_PostCr_Sys (AccessedDomainID);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Grant_Global_ResPerm"                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Grant_Global_ResPerm (
    AccessorResourceID NUMBER(19) CONSTRAINT NN_GrGbRP_AccessorResourceID NOT NULL,
    AccessedDomainID NUMBER(19) CONSTRAINT NN_GrGbRP_AccessedDomainID NOT NULL,
    ResourceClassID NUMBER(19) CONSTRAINT NN_GrGbRP_ResourceClassID NOT NULL,
    PermissionID NUMBER(19) CONSTRAINT NN_GrGbRP_PermissionID NOT NULL,
    IsWithGrant NUMBER(1) CONSTRAINT NN_GrGbRP_IsWithGrant NOT NULL,
    GrantorResourceID NUMBER(19) CONSTRAINT NN_GrGbRP_GrantorResourceID NOT NULL,
    CONSTRAINT PK_GrGbRP PRIMARY KEY (AccessorResourceID, AccessedDomainID, ResourceClassID, PermissionID)
);

CREATE INDEX RSF.IX_GrGbRP_ResourceClassID ON RSF.RSF_Grant_Global_ResPerm (ResourceClassID,PermissionID);

CREATE INDEX RSF.IX_GrGbRP_AccessorResourceID ON RSF.RSF_Grant_Global_ResPerm (AccessorResourceID);

CREATE INDEX RSF.IX_GrGbRP_GrantorResourceID ON RSF.RSF_Grant_Global_ResPerm (GrantorResourceID);

CREATE INDEX RSF.IX_GrGbRP_AccessedDomainID ON RSF.RSF_Grant_Global_ResPerm (AccessedDomainID);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Grant_Global_ResPerm_Sys"                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Grant_Global_ResPerm_Sys (
    AccessorResourceID NUMBER(19) CONSTRAINT NN_GrGbRPSys_AccessorResID NOT NULL,
    AccessedDomainID NUMBER(19) CONSTRAINT NN_GrGbRPSys_AccessedDomainID NOT NULL,
    ResourceClassID NUMBER(19) CONSTRAINT NN_GrGbRPSys_ResourceClassID NOT NULL,
    SysPermissionID NUMBER(19) CONSTRAINT NN_GrGbRPSys_SysPermissionID NOT NULL,
    IsWithGrant NUMBER(1) CONSTRAINT NN_GrGbRPSys_IsWithGrant NOT NULL,
    GrantorResourceID NUMBER(19) CONSTRAINT NN_GrGbRPSys_GrantorResourceID NOT NULL,
    CONSTRAINT PK_GrGbRPSys PRIMARY KEY (AccessorResourceID, AccessedDomainID, ResourceClassID, SysPermissionID)
);

CREATE INDEX RSF.IX_GrGbRPSys_AccessorResID ON RSF.RSF_Grant_Global_ResPerm_Sys (AccessorResourceID);

CREATE INDEX RSF.IX_GrGbRPSys_GrantorResourceID ON RSF.RSF_Grant_Global_ResPerm_Sys (GrantorResourceID);

CREATE INDEX RSF.IX_GrGbRPSys_AccessedDomainID ON RSF.RSF_Grant_Global_ResPerm_Sys (AccessedDomainID);

CREATE INDEX RSF.IX_GrGbRPSys_ResClassID ON RSF.RSF_Grant_Global_ResPerm_Sys (ResourceClassID);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Grant_ResCrPerm_Sys"                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Grant_ResCrPerm_Sys (
    AccessorResourceID NUMBER(19) CONSTRAINT NN_GrRCrPSys_AccessorResID NOT NULL,
    AccessedDomainID NUMBER(19) CONSTRAINT NN_GrRCrPSys_AccessedDomID NOT NULL,
    ResourceClassID NUMBER(19) CONSTRAINT NN_GrRCrPSys_ResClassID NOT NULL,
    SysPermissionID NUMBER(19) CONSTRAINT NN_GrRCrPSys_SysPermissionID NOT NULL,
    IsWithGrant NUMBER(1) CONSTRAINT NN_GrRCrPSys_IsWithGrant NOT NULL,
    GrantorResourceID NUMBER(19) CONSTRAINT NN_GrRCrPSys_GrantorResID NOT NULL,
    CONSTRAINT PK_GrRCrPSys PRIMARY KEY (AccessorResourceID, AccessedDomainID, ResourceClassID, SysPermissionID)
);

CREATE INDEX RSF.IX_GrRCrPSys_AccessorResID ON RSF.RSF_Grant_ResCrPerm_Sys (AccessorResourceID);

CREATE INDEX RSF.IX_GrRCrPSys_GrantorResID ON RSF.RSF_Grant_ResCrPerm_Sys (GrantorResourceID);

CREATE INDEX RSF.IX_GrRCrPSys_ResClassID ON RSF.RSF_Grant_ResCrPerm_Sys (ResourceClassID);

CREATE INDEX RSF.IX_GrRCrPSys_AccessedDomID ON RSF.RSF_Grant_ResCrPerm_Sys (AccessedDomainID);

/* ---------------------------------------------------------------------- */
/* Add table "RSF_Grant_DomCrPerm_Sys"                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE RSF.RSF_Grant_DomCrPerm_Sys (
    AccessorResourceID NUMBER(19) CONSTRAINT NN_GrDCrPSys_AccessorResID NOT NULL,
    SysPermissionID NUMBER(19) CONSTRAINT NN_GrDCrPSys_SysPermissionID NOT NULL,
    IsWithGrant NUMBER(1) CONSTRAINT NN_GrDCrPSys_IsWithGrant NOT NULL,
    GrantorResourceID NUMBER(19) CONSTRAINT NN_GrDCrPSys_GrantorResID NOT NULL,
    CONSTRAINT PK_GrDCrPSys PRIMARY KEY (AccessorResourceID, SysPermissionID)
);

CREATE INDEX RSF.IX_GrDCrPSys_AccessorResID ON RSF.RSF_Grant_DomCrPerm_Sys (AccessorResourceID);

CREATE INDEX RSF.IX_GrDCrPSys_GrantorResID ON RSF.RSF_Grant_DomCrPerm_Sys (GrantorResourceID);

/* ---------------------------------------------------------------------- */
/* Foreign key constraints                                                */
/* ---------------------------------------------------------------------- */

ALTER TABLE RSF.RSF_Domain ADD CONSTRAINT D_D_ParentDomainID 
    FOREIGN KEY (ParentDomainID) REFERENCES RSF.RSF_Domain (DomainID);

ALTER TABLE RSF.RSF_ResourceClassPermission ADD CONSTRAINT RCP_RC_ResourceClassID 
    FOREIGN KEY (ResourceClassID) REFERENCES RSF.RSF_ResourceClass (ResourceClassID);

ALTER TABLE RSF.RSF_Resource ADD CONSTRAINT R_RC_ResourceClassID 
    FOREIGN KEY (ResourceClassID) REFERENCES RSF.RSF_ResourceClass (ResourceClassID);

ALTER TABLE RSF.RSF_Resource ADD CONSTRAINT R_D_DomainID 
    FOREIGN KEY (DomainID) REFERENCES RSF.RSF_Domain (DomainID);

ALTER TABLE RSF.RSF_Grant_ResPerm ADD CONSTRAINT GrRP_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResPerm ADD CONSTRAINT GrRP_R_AccessedResourceID 
    FOREIGN KEY (AccessedResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResPerm ADD CONSTRAINT GrRP_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResPerm ADD CONSTRAINT GrRP_RCP_ResourceClassID 
    FOREIGN KEY (ResourceClassID, PermissionID) REFERENCES RSF.RSF_ResourceClassPermission (ResourceClassID,PermissionID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_PostCr ADD CONSTRAINT GrRCrPPoCr_RCP_ResClassID 
    FOREIGN KEY (ResourceClassID, PostCreatePermissionID) REFERENCES RSF.RSF_ResourceClassPermission (ResourceClassID,PermissionID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_PostCr ADD CONSTRAINT GrRCrPPoCr_R_AccessorResID 
    FOREIGN KEY (AccessorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_PostCr ADD CONSTRAINT GrRCrPPoCr_R_GrantorResID 
    FOREIGN KEY (GrantorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_PostCr ADD CONSTRAINT GrRCrPPoCr_D_AccessedDomainID 
    FOREIGN KEY (AccessedDomainID) REFERENCES RSF.RSF_Domain (DomainID);

ALTER TABLE RSF.RSF_Grant_DomPerm_Sys ADD CONSTRAINT GrDPSys_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_DomPerm_Sys ADD CONSTRAINT GrDPSys_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_DomPerm_Sys ADD CONSTRAINT GrDPSys_D_AccessedDomID 
    FOREIGN KEY (AccessedDomainID) REFERENCES RSF.RSF_Domain (DomainID);

ALTER TABLE RSF.RSF_Grant_DomCrPerm_PostCr_Sys ADD CONSTRAINT GrDCrPPoCrSys_R_AccessorResID 
    FOREIGN KEY (AccessorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_DomCrPerm_PostCr_Sys ADD CONSTRAINT GrDCrPPoCrSys_R_GrantorResID 
    FOREIGN KEY (GrantorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResPerm_Sys ADD CONSTRAINT GrRPSys_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResPerm_Sys ADD CONSTRAINT GrRPSys_R_AccessedResourceID 
    FOREIGN KEY (AccessedResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResPerm_Sys ADD CONSTRAINT GrRPSys_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResPerm_Sys ADD CONSTRAINT GrRPSys_RC_ResourceClassID 
    FOREIGN KEY (ResourceClassID) REFERENCES RSF.RSF_ResourceClass (ResourceClassID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_PostCr_Sys ADD CONSTRAINT GrRCrPPoCrSys_R_AccessorResID 
    FOREIGN KEY (AccessorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_PostCr_Sys ADD CONSTRAINT GrRCrPPoCrSys_R_GrantorResID 
    FOREIGN KEY (GrantorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_PostCr_Sys ADD CONSTRAINT GrRCrPPoCrSys_RC_ResClassID 
    FOREIGN KEY (ResourceClassID) REFERENCES RSF.RSF_ResourceClass (ResourceClassID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_PostCr_Sys ADD CONSTRAINT GrRCrPPoCrSys_D_AccessedDomID 
    FOREIGN KEY (AccessedDomainID) REFERENCES RSF.RSF_Domain (DomainID);

ALTER TABLE RSF.RSF_Grant_Global_ResPerm ADD CONSTRAINT GrGbRP_RCP_ResClassID 
    FOREIGN KEY (ResourceClassID, PermissionID) REFERENCES RSF.RSF_ResourceClassPermission (ResourceClassID,PermissionID);

ALTER TABLE RSF.RSF_Grant_Global_ResPerm ADD CONSTRAINT GrGbRP_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_Global_ResPerm ADD CONSTRAINT GrGbRP_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_Global_ResPerm ADD CONSTRAINT GrGbRP_D_AccessedDomainID 
    FOREIGN KEY (AccessedDomainID) REFERENCES RSF.RSF_Domain (DomainID);

ALTER TABLE RSF.RSF_Grant_Global_ResPerm_Sys ADD CONSTRAINT GrGbRPSys_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_Global_ResPerm_Sys ADD CONSTRAINT GrGbRPSys_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_Global_ResPerm_Sys ADD CONSTRAINT GrGbRPSys_D_AccessedDomID 
    FOREIGN KEY (AccessedDomainID) REFERENCES RSF.RSF_Domain (DomainID);

ALTER TABLE RSF.RSF_Grant_Global_ResPerm_Sys ADD CONSTRAINT GrGbRPSys_RC_ResClassID 
    FOREIGN KEY (ResourceClassID) REFERENCES RSF.RSF_ResourceClass (ResourceClassID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_Sys ADD CONSTRAINT GrRCrPSys_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_Sys ADD CONSTRAINT GrRCrPSys_D_AccessedDomainID 
    FOREIGN KEY (AccessedDomainID) REFERENCES RSF.RSF_Domain (DomainID);

ALTER TABLE RSF.RSF_Grant_ResCrPerm_Sys ADD CONSTRAINT GrRCrPSys_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_DomCrPerm_Sys ADD CONSTRAINT GrDCrPSys_R_AccessorResourceID 
    FOREIGN KEY (AccessorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);

ALTER TABLE RSF.RSF_Grant_DomCrPerm_Sys ADD CONSTRAINT GrDCrPSys_R_GrantorResourceID 
    FOREIGN KEY (GrantorResourceID) REFERENCES RSF.RSF_Resource (ResourceID);
