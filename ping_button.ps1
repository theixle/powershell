# Load the forms assembly
Add-Type -AssemblyName System.Windows.Forms

# Create a new form
$form = New-Object System.Windows.Forms.Form

# Create a new button
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size (35,35)
$button.Size = New-Object System.Drawing.Size (120,23)
$button.Text = "Ping Google"

# Create a new TextBox
$textbox = New-Object System.Windows.Forms.TextBox
$textbox.Multiline = $true
$textbox.ScrollBars = "Vertical"
$textbox.Location = New-Object System.Drawing.Size (35, 70)
$textbox.Size = New-Object System.Drawing.Size (250, 150)

# Define the action to take when the button is clicked
$button_click = {
    # Run the command and capture the output
    $output = Test-Connection google.com

    # Display the output in the TextBox
    $textbox.Text = $output | Out-String
}

# Add the click event to the button
$button.Add_Click($button_click)

# Add the button and TextBox to the form
$form.Controls.Add($button)
$form.Controls.Add($textbox)

# Show the form
$form.ShowDialog()

# Add the click event to the button
$button.Add_Click($button_click)

# Add the button to the form
$form.Controls.Add($button)

# Show the form
$form.ShowDialog()