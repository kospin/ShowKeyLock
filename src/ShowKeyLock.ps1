
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(300,100)
$Form.text                       = "鎖定鍵偵測"
$Form.TopMost                    = $true
$Form.FormBorderStyle            = [System.Windows.Forms.BorderStyle]::Fixed3D
$form.MinimizeBox                = $false
$Form.maximizeBox                = $false

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = ''
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(34,40)

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = ''
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(114,40)

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = ''
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(187,40)

$Form.controls.AddRange(@($Label1,$Label2,$Label3))

function lockstate(){
    if (([System.Windows.Input.Keyboard]::IsKeyToggled([System.Windows.Input.Key]::Numlock)))
    {
        $Label1.text = [System.Windows.Input.Key]::Numlock 
    }
    else 
    {
        $Label1.text = "" 
    }  
    if (([System.Windows.Input.Keyboard]::IsKeyToggled([System.Windows.Input.Key]::CapsLock)))
    {
        $Label2.text = [System.Windows.Input.Key]::CapsLock
    }
    else 
    {
        $Label2.text = "" 
    }
    if (([System.Windows.Input.Keyboard]::IsKeyToggled([System.Windows.Input.Key]::Scroll)))
    {
        $Label3.text = [System.Windows.Input.Key]::Scroll
    }
    else 
    {
        $Label3.text = "" 
    }
}

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 100
$timer.Add_Tick({lockstate})
$timer.Start()
[void]$Form.ShowDialog()
