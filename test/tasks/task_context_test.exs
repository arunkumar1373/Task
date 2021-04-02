defmodule Tasks.TaskContextTest do
  use Tasks.DataCase

  alias Tasks.TaskContext

  describe "task" do
    alias Tasks.TaskContext.Task

    @valid_attrs %{teacher: "some teacher"}
    @update_attrs %{teacher: "some updated teacher"}
    @invalid_attrs %{teacher: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskContext.create_task()

      task
    end

    test "list_task/0 returns all task" do
      task = task_fixture()
      assert TaskContext.list_task() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert TaskContext.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = TaskContext.create_task(@valid_attrs)
      assert task.teacher == "some teacher"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskContext.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = TaskContext.update_task(task, @update_attrs)
      assert task.teacher == "some updated teacher"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskContext.update_task(task, @invalid_attrs)
      assert task == TaskContext.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = TaskContext.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> TaskContext.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = TaskContext.change_task(task)
    end
  end

  describe "teacher" do
    alias Tasks.TaskContext.Teacher

    @valid_attrs %{teacher: "some teacher"}
    @update_attrs %{teacher: "some updated teacher"}
    @invalid_attrs %{teacher: nil}

    def teacher_fixture(attrs \\ %{}) do
      {:ok, teacher} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskContext.create_teacher()

      teacher
    end

    test "list_teacher/0 returns all teacher" do
      teacher = teacher_fixture()
      assert TaskContext.list_teacher() == [teacher]
    end

    test "get_teacher!/1 returns the teacher with given id" do
      teacher = teacher_fixture()
      assert TaskContext.get_teacher!(teacher.id) == teacher
    end

    test "create_teacher/1 with valid data creates a teacher" do
      assert {:ok, %Teacher{} = teacher} = TaskContext.create_teacher(@valid_attrs)
      assert teacher.teacher == "some teacher"
    end

    test "create_teacher/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskContext.create_teacher(@invalid_attrs)
    end

    test "update_teacher/2 with valid data updates the teacher" do
      teacher = teacher_fixture()
      assert {:ok, %Teacher{} = teacher} = TaskContext.update_teacher(teacher, @update_attrs)
      assert teacher.teacher == "some updated teacher"
    end

    test "update_teacher/2 with invalid data returns error changeset" do
      teacher = teacher_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskContext.update_teacher(teacher, @invalid_attrs)
      assert teacher == TaskContext.get_teacher!(teacher.id)
    end

    test "delete_teacher/1 deletes the teacher" do
      teacher = teacher_fixture()
      assert {:ok, %Teacher{}} = TaskContext.delete_teacher(teacher)
      assert_raise Ecto.NoResultsError, fn -> TaskContext.get_teacher!(teacher.id) end
    end

    test "change_teacher/1 returns a teacher changeset" do
      teacher = teacher_fixture()
      assert %Ecto.Changeset{} = TaskContext.change_teacher(teacher)
    end
  end

  describe "subject" do
    alias Tasks.TaskContext.Subject

    @valid_attrs %{subject: "some subject"}
    @update_attrs %{subject: "some updated subject"}
    @invalid_attrs %{subject: nil}

    def subject_fixture(attrs \\ %{}) do
      {:ok, subject} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskContext.create_subject()

      subject
    end

    test "list_subject/0 returns all subject" do
      subject = subject_fixture()
      assert TaskContext.list_subject() == [subject]
    end

    test "get_subject!/1 returns the subject with given id" do
      subject = subject_fixture()
      assert TaskContext.get_subject!(subject.id) == subject
    end

    test "create_subject/1 with valid data creates a subject" do
      assert {:ok, %Subject{} = subject} = TaskContext.create_subject(@valid_attrs)
      assert subject.subject == "some subject"
    end

    test "create_subject/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskContext.create_subject(@invalid_attrs)
    end

    test "update_subject/2 with valid data updates the subject" do
      subject = subject_fixture()
      assert {:ok, %Subject{} = subject} = TaskContext.update_subject(subject, @update_attrs)
      assert subject.subject == "some updated subject"
    end

    test "update_subject/2 with invalid data returns error changeset" do
      subject = subject_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskContext.update_subject(subject, @invalid_attrs)
      assert subject == TaskContext.get_subject!(subject.id)
    end

    test "delete_subject/1 deletes the subject" do
      subject = subject_fixture()
      assert {:ok, %Subject{}} = TaskContext.delete_subject(subject)
      assert_raise Ecto.NoResultsError, fn -> TaskContext.get_subject!(subject.id) end
    end

    test "change_subject/1 returns a subject changeset" do
      subject = subject_fixture()
      assert %Ecto.Changeset{} = TaskContext.change_subject(subject)
    end
  end

  describe "teacher_subject" do
    alias Tasks.TaskContext.TeacherSubject

    @valid_attrs %{subject_id: 42, teacher_id: 42}
    @update_attrs %{subject_id: 43, teacher_id: 43}
    @invalid_attrs %{subject_id: nil, teacher_id: nil}

    def teacher_subject_fixture(attrs \\ %{}) do
      {:ok, teacher_subject} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskContext.create_teacher_subject()

      teacher_subject
    end

    test "list_teacher_subject/0 returns all teacher_subject" do
      teacher_subject = teacher_subject_fixture()
      assert TaskContext.list_teacher_subject() == [teacher_subject]
    end

    test "get_teacher_subject!/1 returns the teacher_subject with given id" do
      teacher_subject = teacher_subject_fixture()
      assert TaskContext.get_teacher_subject!(teacher_subject.id) == teacher_subject
    end

    test "create_teacher_subject/1 with valid data creates a teacher_subject" do
      assert {:ok, %TeacherSubject{} = teacher_subject} = TaskContext.create_teacher_subject(@valid_attrs)
      assert teacher_subject.subject_id == 42
      assert teacher_subject.teacher_id == 42
    end

    test "create_teacher_subject/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskContext.create_teacher_subject(@invalid_attrs)
    end

    test "update_teacher_subject/2 with valid data updates the teacher_subject" do
      teacher_subject = teacher_subject_fixture()
      assert {:ok, %TeacherSubject{} = teacher_subject} = TaskContext.update_teacher_subject(teacher_subject, @update_attrs)
      assert teacher_subject.subject_id == 43
      assert teacher_subject.teacher_id == 43
    end

    test "update_teacher_subject/2 with invalid data returns error changeset" do
      teacher_subject = teacher_subject_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskContext.update_teacher_subject(teacher_subject, @invalid_attrs)
      assert teacher_subject == TaskContext.get_teacher_subject!(teacher_subject.id)
    end

    test "delete_teacher_subject/1 deletes the teacher_subject" do
      teacher_subject = teacher_subject_fixture()
      assert {:ok, %TeacherSubject{}} = TaskContext.delete_teacher_subject(teacher_subject)
      assert_raise Ecto.NoResultsError, fn -> TaskContext.get_teacher_subject!(teacher_subject.id) end
    end

    test "change_teacher_subject/1 returns a teacher_subject changeset" do
      teacher_subject = teacher_subject_fixture()
      assert %Ecto.Changeset{} = TaskContext.change_teacher_subject(teacher_subject)
    end
  end
end
