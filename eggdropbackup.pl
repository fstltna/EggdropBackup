#!/usr/bin/perl

# Set these for your situation
my $EGGDROPDIR = "/home/eggdrop/eggdrop/";
my $BACKUPDIR = "/home/eggdrop/backups";
my $TARCMD = "/bin/tar czf";

#-------------------
# No changes below here...
#-------------------
my $VERSION = "1.0";

print "EggdropBackup.pl version $VERSION\n";
print "==============================\n";
if (! -d $BACKUPDIR)
{
	print "Backup dir $BACKUPDIR not found, creating...\n";
	system("mkdir -p $BACKUPDIR");
}
print "Moving existing backups: ";

if (-f "$BACKUPDIR/eggdropbackup-5.tgz")
{
	unlink("$BACKUPDIR/eggdropbackup-5.tgz")  or warn "Could not unlink $BACKUPDIR/eggdropbackup-5.tgz: $!";
}
if (-f "$BACKUPDIR/eggdropbackup-4.tgz")
{
	rename("$BACKUPDIR/eggdropbackup-4.tgz", "$BACKUPDIR/eggdropbackup-5.tgz");
}
if (-f "$BACKUPDIR/eggdropbackup-3.tgz")
{
	rename("$BACKUPDIR/eggdropbackup-3.tgz", "$BACKUPDIR/eggdropbackup-4.tgz");
}
if (-f "$BACKUPDIR/eggdropbackup-2.tgz")
{
	rename("$BACKUPDIR/eggdropbackup-2.tgz", "$BACKUPDIR/eggdropbackup-3.tgz");
}
if (-f "$BACKUPDIR/eggdropbackup-1.tgz")
{
	rename("$BACKUPDIR/eggdropbackup-1.tgz", "$BACKUPDIR/eggdropbackup-2.tgz");
}
print "Done\nCreating New Backup: ";
system("$TARCMD $BACKUPDIR/eggdropbackup-1.tgz $EGGDROPDIR");
print("Done!\n");
exit 0;
