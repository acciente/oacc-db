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

/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V7.3.4                     */
/* Target DBMS:           Oracle 11g                                      */
/* Project file:          oacc-schema-design.dez                          */
/* Project name:          OACC                                            */
/* Author:                Adinath Raveendra Raj                           */
/* Script type:           Database drop script                            */
/* Created on:            2015-11-02 18:16                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

ALTER TABLE OACC.OAC_Domain DROP CONSTRAINT D_D_ParentDomainID;

ALTER TABLE OACC.OAC_ResourceClassPermission DROP CONSTRAINT RCP_RC_ResourceClassID;

ALTER TABLE OACC.OAC_Resource DROP CONSTRAINT R_RC_ResourceClassID;

ALTER TABLE OACC.OAC_Resource DROP CONSTRAINT R_D_DomainID;

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT GrRP_R_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT GrRP_R_AccessedResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT GrRP_R_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT GrRP_RCP_ResourceClassID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT GrRCrPPoCr_RCP_ResClassID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT GrRCrPPoCr_R_AccessorResID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT GrRCrPPoCr_R_GrantorResID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT GrRCrPPoCr_D_AccessedDomainID;

ALTER TABLE OACC.OAC_Grant_DomPerm_Sys DROP CONSTRAINT GrDPSys_R_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_DomPerm_Sys DROP CONSTRAINT GrDPSys_R_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_DomPerm_Sys DROP CONSTRAINT GrDPSys_D_AccessedDomID;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_PostCr_Sys DROP CONSTRAINT GrDCrPPoCrSys_R_AccessorResID;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_PostCr_Sys DROP CONSTRAINT GrDCrPPoCrSys_R_GrantorResID;

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT GrRPSys_R_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT GrRPSys_R_AccessedResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT GrRPSys_R_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT GrRPSys_RC_ResourceClassID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT GrRCrPPoCrSys_R_AccessorResID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT GrRCrPPoCrSys_R_GrantorResID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT GrRCrPPoCrSys_RC_ResClassID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT GrRCrPPoCrSys_D_AccessedDomID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT GrGbRP_RCP_ResClassID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT GrGbRP_R_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT GrGbRP_R_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT GrGbRP_D_AccessedDomainID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT GrGbRPSys_R_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT GrGbRPSys_R_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT GrGbRPSys_D_AccessedDomID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT GrGbRPSys_RC_ResClassID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_Sys DROP CONSTRAINT GrRCrPSys_R_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_Sys DROP CONSTRAINT GrRCrPSys_D_AccessedDomainID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_Sys DROP CONSTRAINT GrRCrPSys_R_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_Sys DROP CONSTRAINT GrDCrPSys_R_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_Sys DROP CONSTRAINT GrDCrPSys_R_GrantorResourceID;

ALTER TABLE OACC.OAC_ResourcePassword DROP CONSTRAINT RP_R_ResourceID;

ALTER TABLE OACC.OAC_ResourceExternalID DROP CONSTRAINT RE_R_ResourceID;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_ResourceExternalID"                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_ResourceExternalID DROP CONSTRAINT NN_RE_ResourceID;

ALTER TABLE OACC.OAC_ResourceExternalID DROP CONSTRAINT NN_RE_ExternalID;

ALTER TABLE OACC.OAC_ResourceExternalID DROP CONSTRAINT PK_RE;

ALTER TABLE OACC.OAC_ResourceExternalID DROP CONSTRAINT UX_ExternalID;

/* Drop table */

DROP TABLE OACC.OAC_ResourceExternalID;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_ResourcePassword"                                      */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_ResourcePassword DROP CONSTRAINT NN_RP_ResourceID;

ALTER TABLE OACC.OAC_ResourcePassword DROP CONSTRAINT NN_RP_Password;

ALTER TABLE OACC.OAC_ResourcePassword DROP CONSTRAINT PK_RP;

/* Drop table */

DROP TABLE OACC.OAC_ResourcePassword;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Grant_DomCrPerm_Sys"                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Grant_DomCrPerm_Sys DROP CONSTRAINT NN_GrDCrPSys_AccessorResID;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_Sys DROP CONSTRAINT NN_GrDCrPSys_SysPermissionID;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_Sys DROP CONSTRAINT NN_GrDCrPSys_IsWithGrant;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_Sys DROP CONSTRAINT NN_GrDCrPSys_GrantorResID;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_Sys DROP CONSTRAINT PK_GrDCrPSys;

/* Drop table */

DROP TABLE OACC.OAC_Grant_DomCrPerm_Sys;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Grant_ResCrPerm_Sys"                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Grant_ResCrPerm_Sys DROP CONSTRAINT NN_GrRCrPSys_AccessorResID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_Sys DROP CONSTRAINT NN_GrRCrPSys_AccessedDomID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_Sys DROP CONSTRAINT NN_GrRCrPSys_ResClassID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_Sys DROP CONSTRAINT NN_GrRCrPSys_SysPermissionID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_Sys DROP CONSTRAINT NN_GrRCrPSys_IsWithGrant;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_Sys DROP CONSTRAINT NN_GrRCrPSys_GrantorResID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_Sys DROP CONSTRAINT PK_GrRCrPSys;

/* Drop table */

DROP TABLE OACC.OAC_Grant_ResCrPerm_Sys;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Grant_Global_ResPerm_Sys"                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT NN_GrGbRPSys_AccessorResID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT NN_GrGbRPSys_AccessedDomainID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT NN_GrGbRPSys_ResourceClassID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT NN_GrGbRPSys_SysPermissionID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT NN_GrGbRPSys_IsWithGrant;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT NN_GrGbRPSys_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm_Sys DROP CONSTRAINT PK_GrGbRPSys;

/* Drop table */

DROP TABLE OACC.OAC_Grant_Global_ResPerm_Sys;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Grant_Global_ResPerm"                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT NN_GrGbRP_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT NN_GrGbRP_AccessedDomainID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT NN_GrGbRP_ResourceClassID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT NN_GrGbRP_PermissionID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT NN_GrGbRP_IsWithGrant;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT NN_GrGbRP_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_Global_ResPerm DROP CONSTRAINT PK_GrGbRP;

/* Drop table */

DROP TABLE OACC.OAC_Grant_Global_ResPerm;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Grant_ResCrPerm_PostCr_Sys"                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrRCrPPoCrSys_AccessorResID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrRCrPPoCrSys_AccessedDomID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrRCrPPoCrSys_ResClassID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrRCrPPoCrSys_PoCrSysPermID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrRCrPPoCrSys_PoCrWithGrant;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrRCrPPoCrSys_IsWithGrant;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrRCrPPoCrSys_GrantorResID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys DROP CONSTRAINT PK_GrRCrPPoCrSys;

/* Drop table */

DROP TABLE OACC.OAC_Grant_ResCrPerm_PostCr_Sys;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Grant_ResPerm_Sys"                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT NN_GrRPSys_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT NN_GrRPSys_AccessedResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT NN_GrRPSys_ResourceClassID;

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT NN_GrRPSys_SysPermissionID;

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT NN_GrRPSys_IsWithGrant;

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT NN_GrRPSys_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm_Sys DROP CONSTRAINT PK_GrRPSys;

/* Drop table */

DROP TABLE OACC.OAC_Grant_ResPerm_Sys;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Grant_DomCrPerm_PostCr_Sys"                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Grant_DomCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrDCrPPoCrSys_AccessorResID;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrDCrPPoCrSys_PoCrSysPermID;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrDCrPPoCrSys_PoCrWithGrant;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrDCrPPoCrSys_IsWithGrant;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_PostCr_Sys DROP CONSTRAINT NN_GrDCrPPoCrSys_GrantorResID;

ALTER TABLE OACC.OAC_Grant_DomCrPerm_PostCr_Sys DROP CONSTRAINT PK_GrDCrPPoCrSys;

/* Drop table */

DROP TABLE OACC.OAC_Grant_DomCrPerm_PostCr_Sys;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Grant_DomPerm_Sys"                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Grant_DomPerm_Sys DROP CONSTRAINT NN_GrDPSys_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_DomPerm_Sys DROP CONSTRAINT NN_GrDPSys_AccessedDomainID;

ALTER TABLE OACC.OAC_Grant_DomPerm_Sys DROP CONSTRAINT NN_GrDPSys_SysPermissionID;

ALTER TABLE OACC.OAC_Grant_DomPerm_Sys DROP CONSTRAINT NN_GrDPSys_IsWithGrant;

ALTER TABLE OACC.OAC_Grant_DomPerm_Sys DROP CONSTRAINT NN_GrDPSys_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_DomPerm_Sys DROP CONSTRAINT PK_GrDPSys;

/* Drop table */

DROP TABLE OACC.OAC_Grant_DomPerm_Sys;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Grant_ResCrPerm_PostCr"                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT NN_GrRCrPPoCr_AccessorResID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT NN_GrRCrPPoCr_AccessedDomainID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT NN_GrRCrPPoCr_ResourceClassID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT NN_GrRCrPPoCr_PostCrPermID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT NN_GrRCrPPoCr_PostCrWithGrant;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT NN_GrRCrPPoCr_IsWithGrant;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT NN_GrRCrPPoCr_GrantorResID;

ALTER TABLE OACC.OAC_Grant_ResCrPerm_PostCr DROP CONSTRAINT PK_GrRCrPPoCr;

/* Drop table */

DROP TABLE OACC.OAC_Grant_ResCrPerm_PostCr;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Grant_ResPerm"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT NN_GrRP_AccessorResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT NN_GrRP_AccessedResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT NN_GrRP_ResourceClassID;

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT NN_GrRP_PermissionID;

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT NN_GrRP_IsWithGrant;

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT NN_GrRP_GrantorResourceID;

ALTER TABLE OACC.OAC_Grant_ResPerm DROP CONSTRAINT PK_GrRP;

/* Drop table */

DROP TABLE OACC.OAC_Grant_ResPerm;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Resource"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Resource DROP CONSTRAINT NN_R_ResourceID;

ALTER TABLE OACC.OAC_Resource DROP CONSTRAINT NN_R_ResourceClassID;

ALTER TABLE OACC.OAC_Resource DROP CONSTRAINT NN_R_DomainID;

ALTER TABLE OACC.OAC_Resource DROP CONSTRAINT PK_R;

/* Drop table */

DROP TABLE OACC.OAC_Resource;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_Domain"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_Domain DROP CONSTRAINT NN_D_DomainID;

ALTER TABLE OACC.OAC_Domain DROP CONSTRAINT NN_D_DomainName;

ALTER TABLE OACC.OAC_Domain DROP CONSTRAINT PK_D;

/* Drop table */

DROP TABLE OACC.OAC_Domain;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_ResourceClassPermission"                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_ResourceClassPermission DROP CONSTRAINT NN_RCP_ResourceClassID;

ALTER TABLE OACC.OAC_ResourceClassPermission DROP CONSTRAINT NN_RCP_PermissionID;

ALTER TABLE OACC.OAC_ResourceClassPermission DROP CONSTRAINT NN_RCP_PermissionName;

ALTER TABLE OACC.OAC_ResourceClassPermission DROP CONSTRAINT PK_RCP;

/* Drop table */

DROP TABLE OACC.OAC_ResourceClassPermission;

/* ---------------------------------------------------------------------- */
/* Drop table "OAC_ResourceClass"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE OACC.OAC_ResourceClass DROP CONSTRAINT NN_RC_ResourceClassID;

ALTER TABLE OACC.OAC_ResourceClass DROP CONSTRAINT NN_RC_ResourceClassName;

ALTER TABLE OACC.OAC_ResourceClass DROP CONSTRAINT NN_RC_IsAuthenticatable;

ALTER TABLE OACC.OAC_ResourceClass DROP CONSTRAINT NN_RC_IsUnauthdCreateAllowed;

ALTER TABLE OACC.OAC_ResourceClass DROP CONSTRAINT PK_RC;

/* Drop table */

DROP TABLE OACC.OAC_ResourceClass;

/* ---------------------------------------------------------------------- */
/* Drop sequences                                                         */
/* ---------------------------------------------------------------------- */

DROP SEQUENCE OACC.OAC_ResourceClassID;

DROP SEQUENCE OACC.OAC_PermissionID;

DROP SEQUENCE OACC.OAC_DomainID;

DROP SEQUENCE OACC.OAC_ResourceID;
