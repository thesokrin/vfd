{
    "Version": "2012-10-17",
    "Statement":[
        {
            "Sid": "AllowAllUsersToListAccounts",
            "Effect": "Allow",
            "Action":[
                "iam:ListAccountAliases",
                "iam:ListUsers",
                "iam:GetAccountSummary"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AllowIndividualUserToSeeAndManageTheirOwnAccountInformation",
            "Effect": "Allow",
            "Action":[
                "iam:ChangePassword",
                "iam:CreateAccessKey",
                "iam:CreateLoginProfile",
                "iam:DeleteAccessKey",
                "iam:DeleteLoginProfile",
                "iam:GetAccountPasswordPolicy",
                "iam:GetLoginProfile",
                "iam:ListAccessKeys",
                "iam:UpdateAccessKey",
                "iam:UpdateLoginProfile",
                "iam:ListSigningCertificates",
                "iam:DeleteSigningCertificate",
                "iam:UpdateSigningCertificate",
                "iam:UploadSigningCertificate",
                "iam:ListSSHPublicKeys",
                "iam:GetSSHPublicKey",
                "iam:DeleteSSHPublicKey",
                "iam:UpdateSSHPublicKey",
                "iam:UploadSSHPublicKey"
            ],
            "Resource": "arn:aws:iam::${aws_account_id}:user/$${aws:username}"
        },
        {
            "Sid": "AllowIndividualUserToListTheirOwnMFA",
            "Effect": "Allow",
            "Action":[
                "iam:ListVirtualMFADevices",
                "iam:ListMFADevices"
            ],
            "Resource":[
                "arn:aws:iam::${aws_account_id}:mfa/*",
                "arn:aws:iam::${aws_account_id}:user/$${aws:username}"
            ]
        },
        {
            "Sid": "AllowIndividualUserToManageTheirOwnMFA",
            "Effect": "Allow",
            "Action":[
                "iam:CreateVirtualMFADevice",
                "iam:DeactivateMFADevice",
                "iam:DeleteVirtualMFADevice",
                "iam:RequestSmsMfaRegistration",
                "iam:FinalizeSmsMfaRegistration",
                "iam:EnableMFADevice",
                "iam:ResyncMFADevice"
            ],
            "Resource":[
                "arn:aws:iam::${aws_account_id}:mfa/$${aws:username}",
                "arn:aws:iam::${aws_account_id}:user/$${aws:username}"
            ]
        }
    ]
}
