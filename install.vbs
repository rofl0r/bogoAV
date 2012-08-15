Option Explicit

Dim oAntiVirusProduct
Dim productName
Dim productGuid

productName = "Bogo Antivirus 2012"
productGuid = "{385C2AD3-E043-1337-CAFE-BABEDEADBEEF}"

' GUID is just some random GUID.
' productGuid = "{385C2AD3-E043-4696-9BD2-961867F4734F}"

Set oAntiVirusProduct = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\SecurityCenter:AntiVirusProduct").Spawninstance_

oAntiVirusProduct.instanceGuid = productGuid
oAntiVirusProduct.displayName = productName
oAntiVirusProduct.productUptoDate = true
oAntiVirusProduct.onAccessScanningEnabled = true
oAntiVirusProduct.Put_